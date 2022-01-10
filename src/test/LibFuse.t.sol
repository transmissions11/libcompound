// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {LibFuse, CToken} from "../LibFuse.sol";

contract LibFuseTest is DSTestPlus {
    CToken f6DAI = CToken(address(0x989273ec41274C4227bCB878C2c26fdd3afbE70d));

    address f6DAIHolder = 0x81649be6A4f00E3098DA5ff4b166122de4f05cC1;

    function testExchangeRate() public {
        assertEq(f6DAI.exchangeRateCurrent(), LibFuse.viewExchangeRate(f6DAI));
    }

    function testBalanceOfUnderlying() public {
        assertEq(f6DAI.balanceOfUnderlying(f6DAIHolder), LibFuse.viewUnderlyingBalanceOf(f6DAI, f6DAIHolder));
    }
}
