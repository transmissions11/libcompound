// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {ICERC20} from "../interfaces/ICERC20.sol";

import {LibFuse} from "../LibFuse.sol";

contract LibFuseTest is DSTestPlus {
    ICERC20 f6DAI = ICERC20(address(0x989273ec41274C4227bCB878C2c26fdd3afbE70d));

    address f6DAIHolder = 0x81649be6A4f00E3098DA5ff4b166122de4f05cC1;

    /*///////////////////////////////////////////////////////////////
                           CORRECTNESS TESTS
    //////////////////////////////////////////////////////////////*/

    function testFuseExchangeRateCorrectness() public {
        assertEq(LibFuse.viewExchangeRate(f6DAI), f6DAI.exchangeRateCurrent());
    }

    function testFuseBalanceOfUnderlyingCorrectness() public {
        assertEq(LibFuse.viewUnderlyingBalanceOf(f6DAI, f6DAIHolder), f6DAI.balanceOfUnderlying(f6DAIHolder));
    }

    /*///////////////////////////////////////////////////////////////
                           GAS SNAPSHOT TESTS
    //////////////////////////////////////////////////////////////*/

    function testFuseBalanceOfUnderlyingViewGas() public view {
        LibFuse.viewUnderlyingBalanceOf(f6DAI, f6DAIHolder);
    }

    function testFuseBalanceOfUnderlyingMutatingGas() public {
        f6DAI.balanceOfUnderlying(f6DAIHolder);
    }

    function testFuseExchangeRateViewGas() public view {
        LibFuse.viewExchangeRate(f6DAI);
    }

    function testFuseExchangeRateMutatingGas() public {
        f6DAI.exchangeRateCurrent();
    }
}
