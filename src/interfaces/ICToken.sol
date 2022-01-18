// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.0;

import {IERC20} from "./IERC20.sol";
import {IInterestRateModel} from "./IInterestRateModel.sol";
import "./IERC20.sol";

interface ICToken is IERC20 {
    function borrow(uint256) external virtual returns (uint256);

    function underlying() external view virtual returns (IERC20);

    function totalBorrows() external view virtual returns (uint256);

    function totalFuseFees() external view virtual returns (uint256);

    function totalReserves() external view virtual returns (uint256);

    function exchangeRateCurrent() external virtual returns (uint256);

    function totalAdminFees() external view virtual returns (uint256);

    function fuseFeeMantissa() external view virtual returns (uint256);

    function adminFeeMantissa() external view virtual returns (uint256);

    function exchangeRateStored() external view virtual returns (uint256);

    function accrualBlockNumber() external view virtual returns (uint256);

    function redeemUnderlying(uint256) external virtual returns (uint256);

    function balanceOfUnderlying(address) external virtual returns (uint256);

    function reserveFactorMantissa() external view virtual returns (uint256);

    function borrowBalanceCurrent(address) external virtual returns (uint256);

    function interestRateModel() external view virtual returns (IInterestRateModel);

    function initialExchangeRateMantissa() external view virtual returns (uint256);
}