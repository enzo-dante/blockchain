# smart contract language

Solidity is a high level language that is a combination of JavaScript, Java, and C++. It is specially designed to write smart contracts and to target the Ethereum Virtual Machine.

---

Private the default visibility modifier for an identifier in a smart contract

price of transaction = gas x gas_price

Address is a special Solidity define composite data type.
- It can hold a 20-byte ethereum address.
- Recall address is a reference address to access a smart contract.
- Address data structure also contains the balance of the account in Wei.
- It also supports a function transfer, to transfer a value to a specific address.

Mapping is a very versatile data structure that is similar to a key value store, it also can be thought of as a hash table.

struct is a composite data type of a group of related data that can be referenced by a single, meaningful, collective name.

 When a block is added to the blockchain, all the transaction confirmed by the block also have the same block time as their confirmation time.
 - A variable called "Now" defined by solidity, returns the block timestamp.
 - This variable is often used for evaluating time related conditions.
 - Recall that now in smart contract is not the time at which the transaction was initiated, but it is the time when it was confirmed.

 Enum or enumerator data type, allows for user defined data types with limited set of meaningful values.
 - Recall that smart contract represent projects of contracts that may transition through radius spaces based on time or input conditions.

Message is a complex data type specific to smart contract.
- It represents the call that can be used to invoke a function of a smart contract.
- It supports many attributes of which we are interested in two of them now.
    - msg.sender that holds the address of the sender,
    - msg.value that has the value in Wei sent by the sender.

---

Title of resource: What is Solidity? Our Guide to the Language of Ethereum Smart Contracts

https://blockonomi.com/solidity-guide/

Description: When you think of Ethereum, you probably think of its powerful smart contract system. For those who don’t know, smart contracts are essentially programs that exist on the Ethereum blockchain. They perform various tasks such as sending or receiving Ether or ERC-20 tokens, among other tasks.

---

Title of resource: Solidity Frequently Asked Questions

https://solidity.readthedocs.io/en/v0.4.24/frequently-asked-questions.html

Description: This website contains a list of frequently asked questions about Solidity.

---

Title of resource: Types

https://solidity.readthedocs.io/en/develop/types.html

Description: Solidity is a statically typed language, which means that the type of each variable (state and local) needs to be specified at compile-time. Solidity provides several elementary types which can be combined to form complex types.

---

Title of resource: Learning Solidity : Tutorial 6 Data Types (Array, Mapping, Struct)

https://www.youtube.com/watch?v=8UhO3IKApSg

Description: This video details Solidity data types.

---

Title of resource: Units and Globally Available Variables

https://solidity.readthedocs.io/en/develop/units-and-global-variables.html

Description: This website details the different units and globally available variables in Solidity.

---

Title of resource: Solidity Tutorials

https://ethereumbuilders.gitbooks.io/guide/content/en/solidity_tutorials.html

Description: Solidity is a high-level language whose syntax is similar to that of JavaScript and it is designed to compile to code for the Ethereum Virtual Machine.

---

Title of resource: Liquid Democracy uses Blockchain to Fix Politics, and Now You Can Vote for It

https://techcrunch.com/2018/02/24/liquid-democracy-uses-blockchain/

Description: A group of technologists and blockchain enthusiasts are asking whether a new approach could reform the voting system, bringing citizens closer to their representatives and holding congressmen accountable to their voters in a public, verifiable way.

---

https://cryptozombies.io/

---

# modifiers & reverts

A modifier typically checks a condition using a require and if the condition failed, the transaction that call the function can be reverted using the revert function.
- modifiers are specified at the entry to a function and executed before the function begins.

This will completely reject the transaction and revert all its state changes.
- There'll be no recording on the blockchain.

# cryptoZombies

The uint data type is an unsigned integer, meaning its value must be non-negative.
- There's also an int data type for signed integers.

```
// Array with a fixed length of 2 elements:
uint[2] fixedArray;
// another fixed Array, can contain 5 strings:
string[5] stringArray;
// a dynamic Array - has no fixed size, can keep growing:
uint[] dynamicArray;

You can also create an array of structs.
```

---

Well, there are two ways in which you can pass an argument to a Solidity function:

1. By value, which means that the Solidity compiler creates a new copy of the parameter's value and passes it to your function.
- This allows your function to modify the value without worrying that the value of the initial parameter gets changed.

2. By reference, which means that your function is called with a... reference to the original variable.
- Thus, if your function changes the value of the variable it receives, the value of the original variable gets changed.

Note: It's convention (but not required) to start function parameter variable names with an underscore (_) in order to differentiate them from global variables. We'll use that convention throughout our tutorial.

---

The above function doesn't actually change state in Solidity — e.g. it doesn't change any values or write anything.

So in this case we could declare it as a view function, meaning it's only viewing the data but not modifying it:

```
function sayHello() public view returns (string memory) {

}
```

Solidity also contains pure functions, which means you're not even accessing any data in the app. Consider the following:

```
function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
```

---

# keccak256

Ethereum has the hash function keccak256 built in, which is a version of SHA3.
- A hash function basically maps an input into a random 256-bit hexidecimal number.
- A slight change in the input will cause a large change in the hash.

Also important, keccak256 expects a single parameter of type bytes. This means that we have to "pack" any parameters before calling keccak256:

```
//6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
keccak256(abi.encodePacked("aaaab"));
//b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
keccak256(abi.encodePacked("aaaac"));
```

# typecasting

Sometimes you need to convert between data types. Take the following example:

```
uint8 a = 5;
uint b = 6;
// throws an error because a * b returns a uint, not uint8:
uint8 c = a * b;
// we have to typecast b as a uint8 to make it work:
uint8 c = a * uint8(b);
```

# events

Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be 'listening' for certain events and take action when they happen.

```
// declare the event
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
  uint result = _x + _y;
  // fire an event to let the app know the function was called:
  emit IntegersAdded(_x, _y, result);
  return result;
}
```