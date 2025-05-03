### Revert Mechanism

- **Interactions:** Communication with contracts is facilitated via message calls.
- **Revert Capability:** A contract can execute a `REVERT`, nullifying all state alterations.
- **Handling Revert:** Each calling contract can opt to manage the success or execute a `REVERT` as well.

### Understanding Message Call Revert

- **No State Mutation:** No changes in state occur upon revert.
- ️ **No Value Transfer:** Revert does not involve any value transfer.
- ️ **No Log Generation:** Revert operations do not emit any logs.
- ️ **Gas Consumption:** Despite the revert, gas is still expended.

### Utilization of `require`

- The `require` statement is commonly employed in the following manner:
  ```solidity
  contract X {
      address owner = msg.sender;

      function ownerOnly() external {
          // REVERT if not the owner
          require(msg.sender == owner, "only owner!");
          // perform owner-specific actions
      }
  }
  ```

### Leveraging Revert

- Revert can be integrated with a string argument like `revert("Unauthorized")` or, preferably:
  ```solidity
  contract X {
      // @notice a non-privileged user attempted to access an admin-only method
      error Unauthorized();

      function adminOnly() external {
          if (!isAdmin(msg.sender)) {
              revert Unauthorized();
          }
      }
  }
  ```
   _Gas Efficient_!

### Implementation of `assert`

- `assert` is suitable for scenarios that should not occur:
  ```solidity
  contract X {
      function withdraw() external {
          uint balance = getBalance(msg.sender);
          sendBalance(msg.sender);

          // they should not still have a balance!
          assert(getBalance(msg.sender) == 0);
      }
  }
  ```