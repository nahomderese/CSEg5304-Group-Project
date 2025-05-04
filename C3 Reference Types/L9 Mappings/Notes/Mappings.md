
# Mappings 

#### Purpose:

- Perform key/value hash lookups efficiently.
- Reserved for storage only.

#### Characteristics:

- Facilitate storage-based data structures.
- Not passable as function arguments.

#### Usage Examples:

- Basic mapping: `mapping(address => bool) isMember;`
- Mapping to a struct: `mapping(address => User) users;`
- Mapping to an array of structs: `mapping(address => Order[]) ordersByAddress;`
- Mapping an ID to a boolean: `mapping(uint256 => bool) allowedIds;`

####  Cautious:

- Nested mappings in structs can be problematic.
- Constructing structs containing nested mappings directly is not supported.
- Instead, initialize mappings separately or build in storage first before assigning fields.

#### Importance:

- Enable efficient data storage and retrieval in Solidity contracts.
- Vital for managing state and implementing various functionalities in decentralized applications (dApps).