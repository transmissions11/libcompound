// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;


import "./ICToken.sol";

interface ICERC20 is ICToken {
    function mint() external payable;

    function repayBorrow() external payable;

    function repayBorrowBehalf(address borrower) external payable;
}