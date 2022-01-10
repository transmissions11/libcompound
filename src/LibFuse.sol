// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {FixedPointMathLib} from "solmate/utils/FixedPointMathLib.sol";

/// @notice Get up to date cToken data without mutating state.
/// @author Transmissions11 (https://github.com/transmissions11/libcompound)
library LibFuse {
    using FixedPointMathLib for uint256;

    function viewUnderlyingBalanceOf(CToken cToken, address user) internal view returns (uint256) {
        return cToken.balanceOf(user).fmul(viewExchangeRate(cToken), 1e18);
    }

    function viewExchangeRate(CToken cToken) internal view returns (uint256) {
        uint256 accrualBlockNumberPrior = cToken.accrualBlockNumber();

        if (accrualBlockNumberPrior == block.number) return cToken.exchangeRateStored();

        uint256 totalCash = cToken.underlying().balanceOf(address(cToken));
        uint256 borrowsPrior = cToken.totalBorrows();
        uint256 reservesPrior = cToken.totalReserves();
        uint256 adminFeesPrior = cToken.totalAdminFees();
        uint256 fuseFeesPrior = cToken.totalFuseFees();

        uint256 interestAccumulated; // Generated in new scope to avoid stack too deep.
        {
            uint256 borrowRateMantissa = cToken.interestRateModel().getBorrowRate(
                totalCash,
                borrowsPrior,
                reservesPrior + adminFeesPrior + fuseFeesPrior
            );

            require(borrowRateMantissa <= 0.0005e16, "RATE_TOO_HIGH");

            interestAccumulated = (borrowRateMantissa * (block.number - accrualBlockNumberPrior)).fmul(
                borrowsPrior,
                1e18
            );
        }

        uint256 totalReserves = cToken.reserveFactorMantissa().fmul(interestAccumulated, 1e18) + reservesPrior;
        uint256 totalAdminFees = cToken.adminFeeMantissa().fmul(interestAccumulated, 1e18) + adminFeesPrior;
        uint256 totalFuseFees = cToken.fuseFeeMantissa().fmul(interestAccumulated, 1e18) + fuseFeesPrior;

        uint256 totalSupply = cToken.totalSupply();

        return
            totalSupply == 0
                ? cToken.initialExchangeRateMantissa()
                : (totalCash + (interestAccumulated + borrowsPrior) - (totalReserves + totalAdminFees + totalFuseFees))
                    .fdiv(totalSupply, 1e18);
    }
}

abstract contract CToken is ERC20 {
    function underlying() external view virtual returns (ERC20);

    function totalBorrows() external view virtual returns (uint256);

    function exchangeRateCurrent() external virtual returns (uint256);

    function totalFuseFees() external view virtual returns (uint256);

    function totalReserves() external view virtual returns (uint256);

    function totalAdminFees() external view virtual returns (uint256);

    function fuseFeeMantissa() external view virtual returns (uint256);

    function adminFeeMantissa() external view virtual returns (uint256);

    function exchangeRateStored() external view virtual returns (uint256);

    function accrualBlockNumber() external view virtual returns (uint256);

    function reserveFactorMantissa() external view virtual returns (uint256);

    function balanceOfUnderlying(address) external virtual returns (uint256);

    function interestRateModel() external view virtual returns (InterestRateModel);

    function initialExchangeRateMantissa() external view virtual returns (uint256);
}

interface InterestRateModel {
    function getBorrowRate(
        uint256 cash,
        uint256 borrows,
        uint256 reserves
    ) external view returns (uint256);
}
