// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {CToken} from "../interfaces/CToken.sol";

import {LibCompound} from "../LibCompound.sol";

contract LibCompoundTest is DSTestPlus {
    CToken cDAI = CToken(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643);
    CToken cUSDC = CToken(0x39AA39c021dfbaE8faC545936693aC917d5E7563);
    CToken cETH = CToken(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);

    address cDAIHolder = 0xA2B47E3D5c44877cca798226B7B8118F9BFb7A56;
    address cUSDCHolder = 0xABDe2F02fE84e083e1920471b54C3612456365Ef;
    address cETHHolder = 0x716034C25D9Fb4b38c837aFe417B7f2b9af3E9AE;

    /*///////////////////////////////////////////////////////////////
                           CORRECTNESS TESTS
    //////////////////////////////////////////////////////////////*/

    function testCompoundExchangeRateCorrectnessDai() public {
        assertEq(LibCompound.viewExchangeRate(cDAI), cDAI.exchangeRateCurrent());
    }

    function testCompoundBalanceOfUnderlyingCorrectnessDai() public {
        assertEq(LibCompound.viewUnderlyingBalanceOf(cDAI, cDAIHolder), cDAI.balanceOfUnderlying(cDAIHolder));
    }

    function testCompoundExchangeRateCorrectnessUsdc() public {
        assertEq(LibCompound.viewExchangeRate(cUSDC), cUSDC.exchangeRateCurrent());
    }

    function testCompoundBalanceOfUnderlyingCorrectnessUsdc() public {
        assertEq(LibCompound.viewUnderlyingBalanceOf(cUSDC, cUSDCHolder), cUSDC.balanceOfUnderlying(cUSDCHolder));
    }

    function testCompoundExchangeRateCorrectnessEth() public {
        assertEq(LibCompound.viewExchangeRate(cETH), cETH.exchangeRateCurrent());
    }

    function testCompoundBalanceOfUnderlyingCorrectnessEth() public {
        assertEq(LibCompound.viewUnderlyingBalanceOf(cETH, cETHHolder), cETH.balanceOfUnderlying(cETHHolder));
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
