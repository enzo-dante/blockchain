# ethereum smart contracts

a smart contract is a piece of code deployed in the blockchain code that enhances the transfer capability.

- Execution of a smart contract is initiated by a message embedded in a transaction

the code is written in solidity and run on an ethereum virtual machine (evm) which allows the smart contract code to run anywhere.

- Solidity has data, functions or methods with modifiers, along with getter and setter functions.

---

Title of resource: Smart Contracts: The Blockchain Technology That Will Replace Lawyers

https://blockgeeks.com/guides/smart-contracts/

Description: Article explains what smart contracts are and how they allow for the disposal of intermediaries which will saves time and conflict for governments and corporations.

---

Title of resource: Introduction to Smart Contracts

https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html

Description: Introduction to the basics of smart contracts and solidity.

---

Title of resource: What is Ethereum?

https://ethdocs.org/en/latest/introduction/what-is-ethereum.html

Description: Introduction to Ethereum, Ethereum Virtual Machine, and how they work.


---

# ethereum structure

an ethereum in composed of:
- a recipient
- signature of sender authorizing structure
- amount in wei
- message to a contract
- STARTGAS (max num steps)
- GASPRICE(fee for computations)

There are two types of Accounts: Externally Owned Accounts and Contract Accounts.

- The accounts (address) can send transactions for ether transfer or they can send transactions to invoke a smart contract code.

wei is the smallest denomination of cryptocurrency on Ethereum.

--

Title of resource: Account Management

https://ethdocs.org/en/latest/account-management.html

Description: Documentation on account management from Ethereum Homestead, an ongoing collaborative effort of volunteers from the Ethereum Community.

---

Title of resource: Native: Account management

https://github.com/ethereum/go-ethereum/wiki/Native:-Account-management

Description: Introduces account management and how it can provide Ethereum integration for your native applications.

---

Title of resource: What Is Meant By The Term “Gas”?

https://ethereum.stackexchange.com/questions/3/what-is-meant-by-the-term-gas

https://blockgeeks.com/guides/ethereum-gas/

Description: Answers on Ethereum stack exchange that explains gas and where it comes from?

---

Miner nodes receive, verify, gather and execute transactions.

Any changes to the value of a state variable in a smart contract are stored on the blockchain.

Ethereum full nodes host the software needed for transaction initiation, validation, mining, block creation, and smart contract execution.

# Incentive Model

GASLIMIT = the amount of gas points available

GASSPENT = actual amount spent at completion of block creation.

the mining incentive model culminates in a proof-of-work puzzle winner miner.

- other miners are called ommers that produce ommer blockes.

External Owned Accounts (EOA) are controlled by private keys.

externally owned accounts (EOA) can send transactions in Ethereum Homestead.

the correct sequence involved in a block creation:

1. Transaction initiated
2. Transactions validated
3. Transactions Bundled & broadcasted
4. Proof of work consensus problem solved
5. Block added to the local chain and propagated to the network.

---

Title of resource: Vitalik Buterin Doubles Down on Ethereum Incentive Strategy

https://www.coindesk.com/vitalik-buterin-doubles-ethereum-incentive-strategy

Description: An article written by Amy Castor that goes into Vitalik’s incentive strategy for Ethereum during the Workshop on Trusted Smart Contracts.

---

Title of resource: Ether

https://ethereum.org/en/dapps/

Description: Official website of ethereum that lists the most important things to know about ethers.

---

Title of resource: Proof of Work vs Proof of Stake: Basic Mining Guide

https://blockgeeks.com/guides/proof-of-work-vs-proof-of-stake/

Description: This article will explain the main differences between Proof of Work vs Proof of Stake and will provide a definition of mining.

---

##### a smart contract represents business logic layer

Smart contract has some advantages including, a smart contract facilitates transaction for transfer of assets other than value or cryptocurrency.

It facilitates implementation of policies for transfer of assets in a decentralized network.

---

Title of resource: Smart Contract: Building blocks for digital markets

https://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart_contracts_2.html

Description: This is a paper by Nick Szabo when he discussed the concept of smart contract. This paper is dated 1996, well before the advent of the cryptocurrency Bitcoin.

---

Title of resource: How to Learn Solidity: The Ultimate Ethereum Coding Guide

https://blockgeeks.com/guides/solidity/

Description: This Guide will walk you step -by-step through learning Solidity.

---

Title of resource: Remix- Solidity IDE

https://remix-ide.readthedocs.io/en/latest/

Description: Remix is an IDE for the smart contract programming language Solidity and has an integrated debugger and testing environment.

# smart contract definition

According to Ethereum Metropolis version, once a smart contract is deployed it is immutable.

---

Title of resource: Structure of a Contract

https://solidity.readthedocs.io/en/develop/structure-of-a-contract.html

Description: Contracts in Solidity are similar to classes in object-oriented languages. Each contract can contain declarations of State Variables, Functions, Function Modifiers, Events, Struct Types and Enum Types. Furthermore, contracts can inherit from other contracts.

---

Title of resource: Introduction to Smart Contracts

https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html

Description: This website provides an introduction to smart contracts.

# processing smart contracts

You cannot execute a smart contract from another smart contract.

##### Here are some of the artifacts generated by the Remix smart contract compile process and their use:

ABI, Application Binary Interface, the interface schema for a transaction to invoke functions on the smart contract instance bytecode.

Contract bytecode, this is the bytecode that is executed for instantiating a smart contract on the EVM.
- Think of it like executing a constructor of a smart contract to create an object.

WebDeploy script, this as two items; json script to web application to invoke smart contract function, script for programmatically deploying a smart contract from a web application.

Gas estimates, this provides a gas estimates for deploying the smart contract and for the function invocation.

Function hashes, first four byte of the function signatures to facilitate function invocation by a transaction.

Instance bytecode, the bytecode of the smart contract instance.

---

Title of resource: Account Types, Gas, and Transactions

https://ethdocs.org/en/latest/contracts-and-transactions/account-types-gas-and-transactions.html

Description: This website details the two type of accounts in Ethereum.

---

# deploying smart contracts

First, a smart contract solution is written in high-level language and compiled bytecode.

An ABI is also generated for high-level language application.
- Example, Web Apps to interact with the binary smart contract.

EVM provides execution environment for a smart contract bytecode.

The smart contract requires an address for itself so that transaction can target it for invocation of its function.

The contract address is generated by hashing the sender's account address and its nonce.
- A unique target account is reserved for smart contract creation and deployment.

If a target's address is zero or null, it is meant for creating a new smart contract using its payload feed.

The payload of a transaction contains the bytecode for the smart contract.
- This code is executed as a part of the transaction execution to instantiate the bytecode for the actual smart contract.
- Similar to how a constructor creates an object, the execution of a smart contract creation transaction results in the deployment of this smart contract code on the EVM.

It is permanently stored in the EVM for future invocation.

![](../../imgs/smart-contract-deployments.gif)

What are used to determine the address of a contract?

- address of the creator's account.
- nonce of the creator's account.

---

Title of resource: Ethereum, Tokens, and Smart Contracts

https://medium.com/@k3no/ethereum-tokens-smart-contracts-80f639f5c46b

Description: This article details Ethereum, tokens, and smart contracts.

---

Title of resource: Decoding the Enigma of Bitcoin Mining

https://medium.com/all-things-ledger/decoding-the-enigma-of-bitcoin-mining-f8b2697bc4e2

Description: “Bitcoin miners” is somewhat a misleading term. The miners are actually “bookkeepers” and “validators” of the network. It is called as Mining because the algorithm somewhat approximates the declining supply of gold and the miner wins an award (which are the new bitcoins created) for their effort.