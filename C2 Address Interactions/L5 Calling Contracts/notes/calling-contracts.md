### Understanding How to Call contracts (Function Targeting)

- **Contextual Insight:** It's crucial to recognize that Solidity's primary function is to compile contracts into bytecode.
- **Chain Agnostic:** Solidity operates independently of the deployment chain's specifics.
- **Address Invocation:** Instructing Solidity to call an address with calldata results in the execution of that action.
- **Utilization Methods:** Both high-level and low-level syntax facilitate this process.

### High-Level Syntax

- High-level syntax for message calls targeting functions is exemplified as follows:
  ```solidity
  contract A {
      uint sum;
      function storeSum(address b) external {
          sum = B(b).add(5, 10);
      }
  }

  contract B {
      function add(uint x, uint y) external returns(uint) {
          return x + y;
      }
  }
  ```

### Equivalent Representation

- Regardless of syntax, the argument remains an address:
  ```solidity
  function storeSum(B b) external {
      sum = b.add(5, 10);
  }
  ```
  Or:
  ```solidity
  function storeSum(address b) external {
      sum = B(b).add(5, 10);
  }
  ```

### Interfaces

- Interfaces operate similarly:
  ```solidity
  contract A {
      uint sum;
      function storeSum(B b) external {
          sum = b.add(5, 10);
      }
  }

  interface B {
      function add(uint, uint) external returns(uint);
  }
  ```
   This constitutes a message call, specifying calldata.

### Low-Level Syntax

- The low-level approach involves:
  ```solidity
  contract A {
      uint sum;
      function storeSum(address b) external {
          (bool success, bytes memory returnData) =
              b.call(abi.encodeWithSignature("add(uint256,uint256)", 5, 10));
          sum = abi.decode(returnData, (uint));
          require(success);
      }
  }

  contract B {
      function add(uint x, uint y) external pure returns(uint) {
          return x + y;
      }
  }
  ```

### Breakdown of `abi.encodeWithSignature`

- `abi.encodeWithSignature` combines:
  - The first 4 bytes of the `keccak256` of the `add` method: `0x771602f7`
  - The first argument as a uint256: `0x0000000000000000000000000000000000000000000000000000000000000005`
  - The second argument as a uint256: `0x000000000000000000000000000000000000000000000000000000000000000a`

  Resulting in final calldata: `0x771602f70000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000a`

### Sending Calldata

- Irrespective of the chosen syntax, Solidity compiles a contract to transmit calldata `0x771602f700000000000000000000000000000000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000a` to a designated address.
It's the developer's responsibility to ensure that the contract at the target address interprets and responds appropriately to this calldata.