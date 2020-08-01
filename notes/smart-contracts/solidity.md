# What's a Wei?

A wei is the smallest sub-unit of Ether — there are 10^18 wei in one ether.

```
// This will convert 1 ETH to Wei
web3js.utils.toWei("1");
```

# smart contract language

 an ethereum token is just a smart contract that keeps track of who owns how much of that token, and some functions so those users can transfer their tokens to other addresses.

Solidity is a high level language that is a combination of JavaScript, Java, and C++. It is specially designed to write smart contracts and to target the Ethereum Virtual Machine.

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

# security overflow & underflows

What's an overflow?

Let's say we have a uint8, which can only have 8 bits. That means the largest number we can store is binary 11111111 (or in decimal, 2^8 - 1 = 255).

```
uint8 number = 255;
number++;
```

In this case, we've caused it to overflow — so number is counterintuitively now equal to 0 even though we increased it. (If you add 1 to binary 11111111, it resets back to 00000000, like a clock going from 23:59 to 00:00).

---

An underflow is similar, where if you subtract 1 from a uint8 that equals 0, it will now equal 255 (because uints are unsigned, and cannot be negative).

# libraries

libraries allow us to use the using keyword, which automatically tacks on all of the library's methods to another data type.

This means we're going to need to implement 2 more libraries to prevent overflow/underflows with our uint16s and uint32s. We can call them SafeMath16 and SafeMath32.

```
function add(uint256 a, uint256 b) internal pure returns (uint256) {
  uint256 c = a + b;
  assert(c >= a);
  return c;
}

// If we call `.add` on a `uint8`, it gets converted to a `uint256`.
// So then it won't overflow at 2^8, since 256 is a valid `uint256`.
```

```
using SafeMath for uint;
// now we can use these methods on any uint
uint test = 2;
test = test.mul(3); // test now equals 6
test = test.add(5); // test now equals 11
```
Basically add just adds 2 uints like +, but it also contains an assert statement to make sure the sum is greater than a. This protects us from overflows.

OpenZeppelin has created a library called SafeMath that prevents these issues by default.

SafeMath's add, sub, mul, and div are functions that do the basic 4 math operations, but throw an error if an overflow or underflow occurs.

```
import "./safemath.sol"

using SafeMath for uint256;

uint256 a = 5;
uint256 b = a.add(3); // 5 + 3 = 8
uint256 c = a.mul(2); // 5 * 2 = 10
```

# tokens

A token on Ethereum is basically just a smart contract that follows some common rules — namely it implements a standard set of functions that all other token contracts share, such as transferFrom(address _from, address _to, uint256 _tokenId) and balanceOf(address _owner).

- Internally the smart contract usually has a mapping, mapping(address => uint256) balances, that keeps track of how much balance each address has.

This means if you build an application that is capable of interacting with one ERC20 token, it's also capable of interacting with any ERC20 token.

- ERC20 tokens are really cool for tokens that act like currencies.

# burning tokens

"burning" a token — basically it's sent to an address that no one has the private key of, essentially making it unrecoverable

---

# inheritance

BabyDoge inherits from Doge. That means if you compile and deploy BabyDoge, it will have access to both catchphrase() and anotherCatchphrase() (and any other public functions we may define on Doge).

```
contract Doge {
  function catchphrase() public returns (string memory) {
    return "So Wow CryptoDoge";
  }
}

contract BabyDoge is Doge {
  function anotherCatchphrase() public returns (string memory) {
    return "Such Moon BabyDoge";
  }
}
```

when using multiple inheritance, you just separate the multiple contracts you're inheriting from with a comma.

```
contract SatoshiNakamoto is NickSzabo, HalFinney {
  // Omg, the secrets of the universe revealed!
}

```

# internal & external

Private the default visibility modifier for an identifier in a smart contract

internal is the same as private, except that it's also accessible to contracts that inherit from this contract.

external is similar to public, except that these functions can ONLY be called outside the contract — they can't be called by other functions inside that contract.

```
contract Sandwich {
  uint private sandwichesEaten = 0;

  function eat() internal {
    sandwichesEaten++;
  }
}

contract BLT is Sandwich {
  uint private baconSandwichesEaten = 0;

  function eatWithBacon() public returns (string memory) {
    baconSandwichesEaten++;
    // We can call this here because it's internal
    eat();
  }
}
```

# multiple returns

```
function multipleReturns() internal returns(uint a, uint b, uint c) {
  return (1, 2, 3);
}

function processMultipleReturns() external {
  uint a;
  uint b;
  uint c;
  // This is how you do multiple assignment:
  (a, b, c) = multipleReturns();
}

// Or if we only cared about one of the values:
function getLastReturnValue() external {
  uint c;
  // We can just leave the other fields blank:
  (,,c) = multipleReturns();
}
```

# if statements

```
function eatBLT(string memory sandwich) public {
  // Remember with strings, we have to compare their keccak256 hashes
  // to check equality
  if (keccak256(abi.encodePacked(sandwich)) == keccak256(abi.encodePacked("BLT"))) {
    eat();
  }
}
```

# structs & enums

struct is a composite data type of a group of related data that can be referenced by a single, meaningful, collective name.

 When a block is added to the blockchain, all the transaction confirmed by the block also have the same block time as their confirmation time.
 - A variable called "Now" defined by solidity, returns the block timestamp.
 - This variable is often used for evaluating time related conditions.
 - Recall that now in smart contract is not the time at which the transaction was initiated, but it is the time when it was confirmed.

 Enum or enumerator data type, allows for user defined data types with limited set of meaningful values.
 - Recall that smart contract represent projects of contracts that may transition through radius spaces based on time or input conditions.

# address & mapping

The Ethereum blockchain is made up of accounts, each account has an address, which you can think of like a bank account number. It's a unique identifier that points to that account.

-  address is owned by a specific user (or a smart contract).

A mapping is essentially a key-value store for storing and looking up data.
- In the first example, the key is an address and the value is a uint, and in the second example the key is a uint and the value a string.

```
// For a financial app, storing a uint that holds the user's account balance:
mapping (address => uint) public accountBalance;
// Or could be used to store / lookup usernames based on userId
mapping (uint => string) userIdToName;
```

# msg.sender & msg.value

msg.sender, which refers to the address of the person (or smart contract) who called the current function.
-  A contract will just sit on the blockchain doing nothing until someone calls one of its functions. So there will always be a msg.sender.

msg.value is a way to see how much Ether was sent to the contract, and ether is a built-in unit.

Message is a complex data type specific to smart contract.
- It represents the call that can be used to invoke a function of a smart contract.
- It supports many attributes of which we are interested in two of them now.
    - msg.sender that holds the address of the sender,
    - msg.value that has the value in Wei sent by the sender.

# require

require makes it so that the function will throw an error and stop executing if some condition is not true:

```
function sayHiToVitalik(string memory _name) public returns (string memory) {
  // Compares if _name equals "Vitalik". Throws an error and exits if not true.
  // (Side note: Solidity doesn't have native string comparison, so we
  // compare their keccak256 hashes to see if the strings are equal)
  require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Vitalik")));
  // If it's true, proceed with the function:
  return "Hi!";
}
```

# import

When you have multiple files and you want to import one file into another, Solidity uses the import keyword:

# payable modifier

payable functions are a special type of function that can receive Ether.

The ETH will get stored in the contract, which you own — this a simple example of how you could make money on your games!

After you send Ether to a contract, it gets stored in the contract's Ethereum account, and it will be trapped there — unless you add a function to withdraw the Ether from the contract.

And most important for _owner variable that it's have to be a address payable type for doing a sending and transferring ether instruction.
- But our owner() isn't a type address payable so we have to explicitly cast to address payable. Casting any integer type like uint160 to address produces an address payable.
- You can transfer Ether to an address using the transfer function, and address(this).balance will return the total balance stored on the contract.

```
contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    address payable _owner = address(uint160(owner()));
    _owner.transfer(address(this).balance);
  }
}
```

# modifiers & reverts


```
contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}
```

A modifier typically checks a condition using a require and if the condition failed, the transaction that call the function can be reverted using the revert function.
- modifiers are specified at the entry to a function and executed before the function begins.
- one of the most common use-cases is to add a quick require check before a function executes.


##### Remember to have the last line of the modifier call the rest of the function with _;.

```
/**
  * @return true if `msg.sender` is the owner of the contract.
  */
function isOwner() public view returns(bool) {
  return msg.sender == _owner;
}

/**
  * @dev Throws if called by any account other than the owner.
  */
modifier onlyOwner() {
  require(isOwner());
  _;
}

/**
  * @dev Allows the current owner to transfer control of the contract to a newOwner.
  * @param newOwner The address to transfer ownership to.
  */
function transferOwnership(address newOwner) public onlyOwner {
  _transferOwnership(newOwner);
}
```
This will completely reject the transaction and revert all its state changes.
- There'll be no recording on the blockchain.

We have visibility modifiers that control when and where the function can be called from: private means it's only callable from other functions inside the contract; internal is like private but can also be called by contracts that inherit from this one; external can only be called outside the contract; and finally public can be called anywhere, both internally and externally.

We also have state modifiers, which tell us how the function interacts with the BlockChain: view tells us that by running the function, no data will be saved/changed. pure tells us that not only does the function not save any data to the blockchain, but it also doesn't read any data from the blockchain. Both of these don't cost any gas to call if they're called externally from outside the contract (but they do cost gas if called internally by another function).

Then we have custom modifiers, which we learned about in Lesson 3: onlyOwner and aboveLevel, for example. For these we can define custom logic to determine how they affect a function.

# storage vs memory

Storage refers to variables stored permanently on the blockchain. Memory variables are temporary, and are erased between external function calls to your contract.
- Think of it like your computer's hard disk vs RAM.
- In order to keep costs down, you want to avoid writing data to storage except when absolutely necessary.

State variables (variables declared outside of functions) are by default storage and written permanently to the blockchain, while variables declared inside functions are memory and will disappear when the function call ends.

```
contract SandwichFactory {
  struct Sandwich {
    string name;
    string status;
  }

  Sandwich[] sandwiches;

  function eatSandwich(uint _index) public {
    // Sandwich mySandwich = sandwiches[_index];

    // ^ Seems pretty straightforward, but solidity will give you a warning
    // telling you that you should explicitly declare `storage` or `memory` here.

    // So instead, you should declare with the `storage` keyword, like:
    Sandwich storage mySandwich = sandwiches[_index];
    // ...in which case `mySandwich` is a pointer to `sandwiches[_index]`
    // in storage, and...
    mySandwich.status = "Eaten!";
    // ...this will permanently change `sandwiches[_index]` on the blockchain.

    // If you just want a copy, you can use `memory`:
    Sandwich memory anotherSandwich = sandwiches[_index + 1];
    // ...in which case `anotherSandwich` will simply be a copy of the
    // data in memory, and...
    anotherSandwich.status = "Eaten!";
    // ...will just modify the temporary variable and have no effect
    // on `sandwiches[_index + 1]`. But you can do this:
    sandwiches[_index + 1] = anotherSandwich;
    // ...if you want to copy the changes back into blockchain storage.
  }
}
```


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

We can't directly pass strings to keccak256.
- Instead, we will pass abi.encodePacked(_species) as an argument on the left side and abi.encodePacked("kitty") as an argument on the right side.

```
if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
  newDna = newDna - newDna % 100 + 99;
}
```

# random numbers

using oracles (a secure way to pull data in from outside of Ethereum) to generate secure random numbers from outside the blockchain.

# ownable contracts

contracts Ownable — meaning they have an owner (you) who has special privileges.

Below is the Ownable contract taken from the OpenZeppelin Solidity library.

So the Ownable contract basically does the following:

- When a contract is created, its constructor sets the owner to msg.sender (the person who deployed it)
  - Constructors: function Ownable() is a constructor, which is an optional special function that has the same name as the contract. It will get executed only one time, when the contract is first created.
- It adds an onlyOwner modifier, which can restrict access to certain functions to only the owner
-It allows you to transfer the contract to a new owner

```
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address private _owner;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() internal {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
  }

  /**
   * @return the address of the owner.
   */
  function owner() public view returns(address) {
    return _owner;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  /**
   * @return true if `msg.sender` is the owner of the contract.
   */
  function isOwner() public view returns(bool) {
    return msg.sender == _owner;
  }

  /**
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}
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

In order to filter events and only listen for changes related to the current user, our Solidity contract would have to use the indexed keyword,

```
event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
```

In this case, because _from and _to are indexed, that means we can filter for them in our event listener in our front end.

```
// Use `filter` to only fire this code when `_to` equals `userAccount`
cryptoZombies.events.Transfer({ filter: { _to: userAccount } })
.on("data", function(event) {
  let data = event.returnValues;
  // The current user just received a zombie!
  // Do something here to update the UI to show it
}).on("error", console.error);
```

# interface

For our contract to talk to another contract on the blockchain that we don't own, first we need to define an interface.

- Instead of curly braces ({ and }), we're simply ending the function declaration with a semi-colon (;).
- So it kind of looks like a contract skeleton. This is how the compiler knows it's an interface.

```
contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}

contract MyContract {
  address NumberInterfaceAddress = 0xab38...
  // ^ The address of the FavoriteNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
  }
}
```

---

# gas

price of transaction = gas x gas_price

Ethereum is like a big, slow, but extremely secure computer. When you execute a function, every single node on the network needs to run that same function to verify its output — thousands of nodes verifying every function execution is what makes Ethereum decentralized, and its data immutable and censorship-resistant.

The creators of Ethereum wanted to make sure someone couldn't clog up the network with an infinite loop, or hog all the network resources with really intensive computations. So they made it so transactions aren't free, and users have to pay for computation time as well as storage.

Solidity reserves 256 bits of storage regardless of the uint size. For example, using uint8 instead of uint (uint256) won't save you any gas.

view functions don't cost any gas when they're called externally by a user.

- This is because view functions don't actually change anything on the blockchain – they only read the data.
- So marking a function with view tells web3.js that it only needs to query your local Ethereum node to run the function, and it doesn't actually have to create a transaction on the blockchain (which would need to be run on every single node, and cost gas).
- This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. So view functions are only free when they're called externally.

# time

The variable now will return the current unix timestamp of the latest block (the number of seconds that have passed since January 1st 1970).

- Unix time is traditionally stored in a 32-bit number. This will lead to the "Year 2038" problem, when 32-bit unix timestamps will overflow and break a lot of legacy systems.

Solidity also contains the time units seconds, minutes, hours, days, weeks and years.
- These will convert to a uint of the number of seconds in that length of time.
- So 1 minutes is 60, 1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), etc.

# comments

@title and @author are straightforward.

@notice explains to a user what the contract / function does. @dev is for explaining extra details to developers.

@param and @return are for describing what each parameter and return value of a function are for.

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

# cryptoZombies

https://cryptozombies.io/

Description: CryptoZombies.io is a free teaching platform to teach existing developers or complete newcomers the ins and out of programming for the Blockchain. Powered by Loom Network - a platform for building commerical scale apps on Ethereum.

---

