// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping(address => bool) hasVoted;
        mapping(address => bool) voteDirection;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;
    address[] public memberList;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    event ProposalExecuted(uint proposalId);

    constructor(address[] memory _members) {
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
            memberList.push(_members[i]);
        }
        members[msg.sender] = true;
        memberList.push(msg.sender);
    }

    modifier onlyMember() {
        require(members[msg.sender], "Not a member");
        _;
    }

    function newProposal(address _target, bytes calldata _data) external onlyMember {
        Proposal storage newProp = proposals.push();
        newProp.target = _target;
        newProp.data = _data;
        newProp.yesCount = 0;
        newProp.noCount = 0;
        newProp.executed = false;
        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool supportsProposal) external onlyMember {
        require(proposalId < proposals.length, "Invalid proposalId");
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal already executed");

        if (proposal.hasVoted[msg.sender]) {
            if (proposal.voteDirection[msg.sender] && !supportsProposal) {
                proposal.yesCount--;
                proposal.noCount++;
            } else if (!proposal.voteDirection[msg.sender] && supportsProposal) {
                proposal.noCount--;
                proposal.yesCount++;
            }
        } else {
            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            proposal.hasVoted[msg.sender] = true;
        }
        proposal.voteDirection[msg.sender] = supportsProposal;
        emit VoteCast(proposalId, msg.sender);

        if (proposal.yesCount >= 10) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
            emit ProposalExecuted(proposalId);
        }
    }
}

