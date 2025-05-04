// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    mapping(address => bool) public hasVoted;

    mapping(address => Choices) public choices;

    mapping(address => bool) public members;

    mapping(address => User) public users;

    function createVote(Choices _choice) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        hasVoted[msg.sender] = true;
        choices[msg.sender] = _choice;
    }

    function changeVote(Choices _newChoice) external {
        require(hasVoted[msg.sender], "You have not cast a vote yet.");
        choices[msg.sender] = _newChoice;
    }

    function addMember(address _member) external {
        members[_member] = true;
    }

    function removeMember(address _member) external {
        members[_member] = false;
    }

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists.");
        users[msg.sender] = User(100, true);
    }

    function checkVoteStatus(address _voter) external view returns (bool) {
        return hasVoted[_voter];
    }

    function findChoice(address _voter) external view returns (Choices) {
        require(hasVoted[_voter], "Voter has not cast a vote yet");
        return choices[_voter];
    }

    function isMember(address _member) external view returns (bool) {
        return members[_member];
    }
}

struct User {
    uint balance;
    bool isActive;
}
