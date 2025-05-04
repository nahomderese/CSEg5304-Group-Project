// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    function addMember(address newMember) external {
        members.push(newMember);
    }

    function isMember(address _address) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _address) {
                return true;
            }
        }
        return false;
    }
}
