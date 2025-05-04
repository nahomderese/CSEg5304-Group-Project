// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] memory input) external {
        for (uint i = 0; i < input.length; i++) {
            if (input[i] % 2 == 0) {
                evenNumbers.push(input[i]);
            }
        }
    }
}
