---
marp: true
---

# Voting: A Real-World Contract

- Any member can submit a proposal
- Members can vote to approve or disapprove it
- If the proposal receives enough yes votes, it is executed
- The proposal includes calldata to be sent to a contract

Because a proposal can execute a message call, it can involve various actions, such as transferring funds or buying an NFT!

The contract functions like an externally owned account (EOA) that requires voter approval for each action.

---

## Example Data

| Proposal ID | Calldata      | Target Contract | Yes Count | No Count |
| ----------- | ------------- | --------------- | --------- | -------- |
| 0           | 0xa1b2...c3d4 | 0x123a4b...efc1 | 100       | 20       |
| 1           | 0xb2c3...d4e5 | 0x987c4d...efc2 | 56        | 10       |
| 2           | 0xc3d4...e5f6 | 0x561a3b...efc3 | 78        | 5        |
| 3           | 0xd4e5...f6g7 | 0x892s3r...efc4 | 212       | 35       |
| 4           | 0xe5f6...g7h8 | 0x2d3x4y...efc5 | 132       | 18       |

---

## Proposal Steps:

1. Create a new `Proposal` struct in storage
2. Allow members to vote on the proposal by its ID
3. Once a `VOTE_THRESHOLD` is met, send the calldata to the target contract

---

## Real-World Notes

- For protocols or DAOs on the blockchain, tokens are used for voting, weighted by the number of tokens held
- The Governor standard has emerged to facilitate voting with tokens
- Proposals can result in multiple message calls, each with its own calldata, value, and target contract
- Voting typically needs to meet participation and approval requirements within a specified timeframe
  - If successful, the proposal is executed after a certain period
  - If unsuccessful, the proposal is defeated