// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {CToken} from "../interfaces/CToken.sol";

import {LibFuse} from "../LibFuse.sol";

contract LibFuseTest is DSTestPlus {
    CToken f6DAI = CToken(0x989273ec41274C4227bCB878C2c26fdd3afbE70d);
    CToken f6ETH = CToken(0xF6551C22276b9Bf62FaD09f6bD6Cad0264b89789);

    address f6DAIHolder = 0x81649be6A4f00E3098DA5ff4b166122de4f05cC1;
    address f6ETHHolder = 0xb48d6C33A96F5519C82569b478fcD723b3A94a2A;

    /*///////////////////////////////////////////////////////////////
                           CORRECTNESS TESTS
    //////////////////////////////////////////////////////////////*/

    function testFuseExchangeRateCorrectnessDai() public {
        assertEq(LibFuse.viewExchangeRate(f6DAI), f6DAI.exchangeRateCurrent());
    }

    function testFuseBalanceOfUnderlyingCorrectnessDai() public {
        assertEq(LibFuse.viewUnderlyingBalanceOf(f6DAI, f6DAIHolder), f6DAI.balanceOfUnderlying(f6DAIHolder));
    }

    function testFuseExchangeRateCorrectnessEth() public {
        assertEq(LibFuse.viewExchangeRate(f6ETH), f6ETH.exchangeRateCurrent());
    }

    function testFuseBalanceOfUnderlyingCorrectnessEth() public {
        assertEq(LibFuse.viewUnderlyingBalanceOf(f6ETH, f6ETHHolder), f6ETH.balanceOfUnderlying(f6ETHHolder));
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
