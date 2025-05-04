// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    mapping(address => bool) public hasVoted;

    mapping(address => Choices) public choices;

    function createVote(Choices _choice) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        hasVoted[msg.sender] = true;
        choices[msg.sender] = _choice;
    }

    function changeVote(Choices _newChoice) external {
        require(hasVoted[msg.sender], "You have not cast a vote yet.");
        choices[msg.sender] = _newChoice;
    }

    function checkVoteStatus(address _voter) external view returns (bool) {
        return hasVoted[_voter];
    }

    function findChoice(address _voter) external view returns (Choices) {
        require(hasVoted[_voter], "Voter has not cast a vote yet");
        return choices[_voter];
    }
}
