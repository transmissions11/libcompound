// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {ICERC20} from "../interfaces/ICERC20.sol";

import {LibCompound} from "../LibCompound.sol";

contract LibCompoundTest is DSTestPlus {
    ICERC20 cDAI = ICERC20(address(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643));

    address cDAIHolder = 0xA2B47E3D5c44877cca798226B7B8118F9BFb7A56;

    /*///////////////////////////////////////////////////////////////
                           CORRECTNESS TESTS
    //////////////////////////////////////////////////////////////*/

    function testCompoundExchangeRateCorrectness() public {
        assertEq(LibCompound.viewExchangeRate(cDAI), cDAI.exchangeRateCurrent());
    }

    function testCompoundBalanceOfUnderlyingCorrectness() public {
        assertEq(LibCompound.viewUnderlyingBalanceOf(cDAI, cDAIHolder), cDAI.balanceOfUnderlying(cDAIHolder));
    }

    /*///////////////////////////////////////////////////////////////
                           GAS SNAPSHOT TESTS
    //////////////////////////////////////////////////////////////*/

    function testCompoundBalanceOfUnderlyingViewGas() public view {
        LibCompound.viewUnderlyingBalanceOf(cDAI, cDAIHolder);
    }

    function testCompoundBalanceOfUnderlyingMutatingGas() public {
        cDAI.balanceOfUnderlying(cDAIHolder);
    }

    function testCompoundExchangeRateViewGas() public view {
        LibCompound.viewExchangeRate(cDAI);
    }

    function testCompoundExchangeRateMutatingGas() public {
        cDAI.exchangeRateCurrent();
    }
}
