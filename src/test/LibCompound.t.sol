// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {LibCompound, CToken} from "../LibCompound.sol";

contract LibCompoundTest is DSTestPlus {
    CToken cDAI = CToken(address(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643));

    address cDAIHolder = 0xA2B47E3D5c44877cca798226B7B8118F9BFb7A56;

    function testExchangeRate() public {
        assertEq(cDAI.exchangeRateCurrent(), LibCompound.viewExchangeRate(cDAI));
    }

    function testBalanceOfUnderlying() public {
        assertEq(cDAI.balanceOfUnderlying(cDAIHolder), LibCompound.viewUnderlyingBalanceOf(cDAI, cDAIHolder));
    }
}