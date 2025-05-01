### Message Call Essentials

- **Objective:** Message calls facilitate the transmission of value and `calldata` to contracts.
- **Transaction Initiation:** The initial message call marks the start of a transaction (from Externally Owned Account (EOA) to contract).
- **Continued Transaction:** Subsequent message calls are integral parts of the ongoing transaction (between contracts).
- **Transaction Finalization:** The transaction concludes, along with any state modifications, upon the completion of the initial function call.

### Deconstructing Message Calls

- **Constituents:** Message calls encompass `gas`, `value`, and `calldata`.
- **Accessible in Solidity:** These values are accessible within Solidity as:
  - `msg.sender`: Originator of the preceding message call.
  - `msg.value`: The quantity in wei transmitted.
  - `msg.data`: The calldata.
  - `msg.sig`: Identification of the function.

### Interaction between EOAs and Contracts

- **Utilization:** Both EOAs and contracts interact with other contracts utilizing the `address` data type.
- **Length Specification:** The `address` data type in Solidity comprises 20 bytes.
- **Role of `msg.sender`:** This attribute refers to an address as delineated in the prior slide.

### Ether Reception by Methods

- **Criterion:** Solely methods marked as `payable` can accept ether.
- **Illustrative Instances:**
  ```solidity
  receive() external payable {
      // Ether can be sent without specifying calldata
  }

  function pay() external payable {
      // This method accepts ether along with calldata
  }
  ```

### Syntax for Value Transmission

- **Syntax Formulation:** `.call{ gas, value }(calldata)`
- **Demonstrative Usage:**
  ```solidity
  constructor(address _otherContract) payable {
      otherContract = _otherContract;
      _otherContract.call{ value: msg.value }("");
  }
  ```

### Management of Success Outcomes

- **Attention Signal:** The Solidity compiler flags potential issues if the success outcome isn't managed.
- **Exemplary Application:**
  ```solidity
  constructor(address _otherContract) payable {
      otherContract = _otherContract;
      (bool success, ) = _otherContract.call{ value: msg.value }("");
      require(success);
  }
  ```