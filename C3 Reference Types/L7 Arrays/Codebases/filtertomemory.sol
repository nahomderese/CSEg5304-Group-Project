// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Contract {
    function filterEven(
        uint[] memory input
    ) external pure returns (uint[] memory) {
        uint evenCount = 0;
        for (uint i = 0; i < input.length; i++) {
            if (input[i] % 2 == 0) {
                evenCount++;
            }
        }

        uint[] memory evenNumbers = new uint[](evenCount);

        uint index = 0;
        for (uint i = 0; i < input.length; i++) {
            if (input[i] % 2 == 0) {
                evenNumbers[index] = input[i];
                index++;
            }
        }

        return evenNumbers;
    }
}
