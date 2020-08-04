# blockchain process

![](../../imgs/blockchain-mechanics.png)

![](../../imgs/blockchain-architecture.png)

# elements of the blockchain

blockchain is a time-stamped chain of immutable records, managed by a cluster of computers and not owned by a single entity.

- the ledger, a growing list of records w/ unique hashes are known as blocks, are linked by cryptography.
- blockchain is essentially a group of connected computers to maintain a single updated ledger.

a useful analogy is to visualize the blockchain as a book.
- book = blockchain
- page = block connected to the previous page through a page number
    - due to the page number sequence, tampering is easy to detect
- an entry on a page = blockchain transaction

##### block header

a block header is made up of:

![](../../imgs/block-composition.png)

- block version is mostly used to tell miners which version it supports.

- the "previous block hash" illustrates the chain building the series of blocks; without it, there would be chronology between blocks.

- the "merkle tree root hash" encodes the block data into an efficient format that allows for quick verification and data transfer between nodes on peer-2-peer blockchain networks.
    - the data itself is hashed for security and optimization.

- nBits is the encoded form of the target threshold for a valid block

- nonce is the string num variable incremented by the "proof-of-work"
    - a miner random guesses, using cpu power, a hash that is smaller than the target.
    - a miner has to guess the nonce (million to billion)to solve and provide proof of work to generate a random string for the new block

    - the nonce value is calculated based on the difficulty target per the blockchain.

- unix timestamps make it difficult for blocks to be manipulated.
    - a timestamp is only valid if it is greater the median of previous 11 blocks.

##### genesis block

![](../../imgs/genesis-block.png)

the genesis block contains the starting balance and is the prototype for all blocks.

in the illustration, sha256(Block 0) is the digital signature of the genesis block and represents previous_block_signature in block 1.

sha256() is an algorithm that compresses data into a unique string of a fixed length.
- this one way compression ouputs the digital signature of the block.


# blockchain miners

in private blockchains, a central authority has the authority over every node in the network.

in public blockchains, anyone can set up their own computer to act as a node and these computers are called miners.

##### a miner builds and adds blocks by solving for the nonce so that the new block signature aligns with the chronology of the blockchain.

a miner has to guess millions or billions of times to identify the correct nonce value of the block.

a miner's work generates proof of work that the particular block has been validated and added to the blockchain.

for a minor's labor, the miner is rewarded with tokens based on difficulty for solving the nonce.

corrupting the blockchain is difficult because the competing miners validate each other's work

- if a hacker wanted to modify a specific block, the hacker would also have to modify all the preceding blocks as well -- which would be costly and time consuming.

- miners always use the "longest chain rule".


# proof of stake

proof of stake where miners develop a reputation based on the number of tokens they own or their status in the market.

# hashing

hashing is the process of taking an item of a any length and coverting it into an output item of a fixed length.

a popular example of hashing is Bitcoin's sha256() that produces a length of 256 bits.

##### a valid nonce is determined by computing several hashes

# merkle tree 

a merkle tree is a data structure trees where each non-leaf node is the hash of its corresponding child nodes.

it basically summarizes the transactions by hashing together hashed transactions which reduces the data size for memory.

![](../../imgs/merkle-tree.png)


since merkle tree are binary, meaning it needs an even number of leaf nodes, the last hash will be duplicated to create an even number of leaf nodes.

- 1 branch of a merkel tree can be downloaded at a time and the integrity can be immediately verified even if the entire merkel tree is not yet available.

##### the main advantage of a merkel tree is that files can be broken up into very small blocks for quick data verification.

merkle tree's hash nodes until it reaches a root node -- the merkle root.

- the merkle root summarizes all the data (the associated transaction) and stored in the header to maintain integrity.
    - if you change any of the transactions it will change the hash and ultimately the merkel root.

---

# blockchain fundamentals

A block is composed of a header of information about the block and a set of valid transactions.

- there was 1 transaction of 50 BTC in the Genesis block in Bitcoin -- the first block in a blockchain.

The transaction uses the amount specified by one or more input UTXOs and transfers it to one or more newly created output UTXOs.

- UTXO = unspent transaction output

basic operations of the blockchain are:

1. validation of transactions
2. gathering transactions for a block
3. broadcasting valid transactions & blocks
4. consensus on next block creation
5. chaining blocks

It true that transaction confirmation is independently performed by all miner nodes.

---

Title of resource: Blockchain: The Invisible Technology That's Changing the World

https://www.pcmag.com/news/blockchain-the-invisible-technology-thats-changing-the-world

Description: Article that expands on a new immutable digital fabric remaking the internet without people even realizing it. It also shows how Blockchain-based networks, decentralized apps (DApps), and distributed ledgers are becoming the foundation of digital life.

---

Title of resource: How a Bitcoin Transaction Works

https://medium.com/blockchain-review/how-does-the-blockchain-work-for-dummies-explained-simply-9f94d386e093

Description: This article explains what a bitcoin transaction is, its purpose and outcome. The explanation in this article is suitable for both novice and intermediate bitcoin users.

---

Title of resource: What is the Difference Between Public and Permissioned Blockchains?

https://www.coindesk.com/learn/blockchain-101/what-is-blockchain-technology

Description: An article that introduces a description of the three technologies that make up blockchain technology: cryptographic keys, a distributed network and a network servicing protocol.

---

Title of resource: A Gentle Introduction to Blockchain Technology

https://bitsonblocks.net/2015/09/09/gentle-introduction-blockchain-technology/

Description: This article is a gentle introduction to blockchain technology and assumes minimal technical knowledge. It attempts to describe “what it is” rather than “why should I care”.

---

Title of resource: On Public and Private Blockchains

https://blog.ethereum.org/2015/08/07/on-public-and-private-blockchains/

Description: A blog posted by Vitalik Buterin, the founder of Ethereum. He goes on to explain the differences between the different types of blockchains.

---

