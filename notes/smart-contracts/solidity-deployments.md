# Web3.js

Remember, Ethereum is made up of nodes that all share a copy of the same data. Setting a Web3 Provider in Web3.js tells our code which node we should be talking to handle our reads and writes.

-  It's kind of like setting the URL of the remote web server for your API calls in a traditional web app.

Once your contract is all set up, we can use Web3.js to talk to it.

Web3.js has two methods we will use to call functions on our contract: call and send.

## Web3.js call and send

Infura is a service that maintains a set of Ethereum nodes with a caching layer for fast reads, which you can access for free through their API. Using Infura as a provider, you can reliably send and receive messages to/from the Ethereum blockchain without needing to set up and maintain your own node.

```
var web3 = new Web3(new Web3.providers.WebsocketProvider("wss://mainnet.infura.io/ws"));
```

call is used for view and pure functions. It only runs on the local node, and won't create a transaction on the blockchain.

```
myContract.methods.myMethod(123).call()
```

send will create a transaction and change data on the blockchain. You'll need to use send for any functions that aren't view or pure.

Note: sending a transaction will require the user to pay gas, and will pop up their Metamask to prompt them to sign a transaction. When we use Metamask as our web3 provider, this all happens automatically when we call send(), and we don't need to do anything special in our code. Pretty cool!

Using Web3.js, you would send a transaction calling a function named myMethod with the parameter 123 as follows:

```
myContract.methods.myMethod(123).send()
```

sending a transaction requires a from address of who's calling the function (which becomes msg.sender in your Solidity code). We'll want this to be the user of our DApp, so MetaMask will pop up to prompt them to sign the transaction.

sending a transaction costs gas

There will be a significant delay from when the user sends a transaction and when that transaction actually takes effect on the blockchain. This is because we have to wait for the transaction to be included in a block, and the block time for Ethereum is on average 15 seconds. If there are a lot of pending transactions on Ethereum or if the user sends too low of a gas price, our transaction may have to wait several blocks to get included, and this could take minutes.

Thus we'll need logic in our app to handle the asynchronous nature of this code.

# MetaMask

MetaMask allows the user to manage multiple accounts in their extension.

We can see which account is currently active on the injected web3 variable via:

```
var userAccount = web3.eth.accounts[0]
```

# public & private keys

Ethereum (and blockchains in general) use a public / private key pair to digitally sign transactions.

# abi

ABI stands for Application Binary Interface. Basically it's a representation of your contracts' methods in JSON format that tells Web3.js how to format function calls in a way your contract will understand.

When you compile your contract to deploy to Ethereum (which we'll cover in Lesson 7), the Solidity compiler will give you the ABI, so you'll need to copy and save this in addition to the contract address.

```
// Instantiate myContract
var myContract = new web3js.eth.Contract(myABI, myContractAddress);
```
