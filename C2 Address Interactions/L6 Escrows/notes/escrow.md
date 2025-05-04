### Escrow 

- **Knowledge Recap:** You now possess an understanding of storage mechanisms and value/data transfer among smart contracts.
- **Achievement Unlocked:** Equipped with the ability to produce practical Solidity contracts!
- **Project Objective:** Let's construct an escrow agreement facilitating value transfer between two parties, overseen by a third party arbitrator.

### Visualizing the Escrow Process

- **Initial Setup:**
  ![escrow-1](imgs/escrow-1.png)

- **Value Transfer and Arbitration:**
  ![escrow-2](imgs/escrow-2.png)

### Broadcasting Events: Communication Milestones 📣

- **Emitting Events:** Signal significant occurrences through event emission.
  ```solidity
  contract Escrow {
      event Approved(uint);

      function approve() external {
          // ...

          emit Approved(address(this).balance);
      }
  }
  ```
