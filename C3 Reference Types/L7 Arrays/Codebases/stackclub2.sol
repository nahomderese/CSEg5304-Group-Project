// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    modifier onlyMember() {
        bool memberExists = false;
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == msg.sender) {
                memberExists = true;
                break;
            }
        }
        require(memberExists, "You must be a member to call this function");
        _;
    }

    function addMember(address newMember) external onlyMember {
        members.push(newMember);
    }

    function removeLastMember() external onlyMember {
        require(
            members.length > 1,
            "There must be at least one member in the club"
        );
        members.pop();
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
