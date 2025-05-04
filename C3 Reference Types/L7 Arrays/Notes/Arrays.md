# Arrays
Arrays in Solidity are indeed a fundamental reference type, offering versatility in handling ordered data. While they may not be as frequently used as mappings, they serve crucial roles in scenarios requiring ordered data or iteration.

characteristics and usage of arrays across different memory locations:
### Storage:

- In storage, arrays can be either dynamic or fixed size.
- Dynamic arrays allow for flexibility with size adjustments, as demonstrated by `uint[] allNumbers`.
- Fixed-size arrays, like `uint[3] favoriteNumbers`, have a predefined length that cannot be modified after initialization.

### Calldata:

- Calldata refers to the data passed into a function, which is immutable (read-only).
- Arrays in calldata, such as `uint[3] calldata arr`, cannot be modified within the function. They serve as input parameters for read-only operations.

### Memory:

- Memory is a temporary storage location where a copy of the reference type is created.
- When passing arrays to functions with `memory` keyword, modifications are local and do not affect the original data.
- For instance, `uint[3] memory arr` allows local modifications without altering the original array.