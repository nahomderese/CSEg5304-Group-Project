---
marp: true
---

# Inheritance

- Effortlessly reuse common patterns and standards.
- Child contracts inherit functions (except `private`) and state variables.
- Child contracts can also access enums, structs, errors, and event definitions.
- Extend or override inherited features to build your functionality.

---

## onlyOwner

This pattern is commonly seen:

```js
contract Example {
  address owner = msg.sender;
  uint importantVar;

  function privilegedMethod(uint x) external onlyOwner {
    importantVar = x;
  }

  error NotTheOwner();
  modifier onlyOwner {
    if (msg.sender != owner) {
      revert NotTheOwner();
    }
    _;
  }
}
```

---

## Modular!

```js
contract Ownable {
  address owner = msg.sender;
  error NotTheOwner();
  modifier onlyOwner {
    if (msg.sender != owner) {
      revert NotTheOwner();
    }
    _;
  }
}

contract Example is Ownable {
  function privilegedMethod(uint x) external onlyOwner {
    importantVar = x;
  }
}
```

---

## Import Statements

Import statements function like copying and pasting code into your file:

```js
import "./Ownable.sol";

contract Example is Ownable {
  function privilegedMethod(uint x) external onlyOwner {
    importantVar = x;
  }
}
```

---

## Inherit Functions

Functions like `transferOwner` are inherited as well:

```js
contract Ownable {
  address owner = msg.sender;

  // 'virtual' allows this method to be overridden
  function transferOwner(address newOwner) public virtual onlyOwner {
    owner = newOwner;
  }

  error NotTheOwner();
  modifier onlyOwner {
    if (msg.sender != owner) {
      revert NotTheOwner();
    }
    _;
  }
}
```

---

## Override

Override methods to extend functionality:

```js
import "./Ownable.sol";

contract Example is Ownable {
  event TransferOwnership(address oldOwner, address newOwner);

  // 'virtual' and 'override' work together,
  // allowing us to override this method because it is declared as virtual in the base contract
  function transferOwner(address newOwner) public override onlyOwner {
    address oldOwner = owner;
    // call the function on the base or parent contract, Ownable
    super.transferOwner(newOwner);
    emit TransferOwnership(oldOwner, newOwner);
  }
}
```
