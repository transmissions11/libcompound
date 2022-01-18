// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;


import "./ICToken.sol";

interface ICERC20 is ICToken {
    function mint(uint256) external virtual returns (uint256);

    function borrow(uint256) external virtual returns (uint256);

    function repayBorrowBehalf(address, uint256) external virtual returns (uint256);
}
