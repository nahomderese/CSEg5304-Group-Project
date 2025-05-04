// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function sum(uint[] memory data) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < data.length; i++) {
            total += data[i];
        }
        return total;
    }
}
