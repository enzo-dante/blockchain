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