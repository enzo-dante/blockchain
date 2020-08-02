# blocks

a block is the smallest unit of a blockchain containing transaction data.

a block is composed of a block header and a block body.

##### block header

the block header is composed of six components:

![](../../../imgs/block-composition.png)

- version number
    - block version is mostly used to tell miners which version it supports.

- previous block hash
    - the "previous block hash" illustrates the chain building the series of blocks; without it, there would be chronology between blocks.

- merkle tree root hash
    - the "merkle tree root hash" encodes the block data into an efficient format that allows for quick verification and data transfer between nodes on peer-2-peer blockchain networks.
        - the data itself is hashed & those hashes are merged and hashed for security and optimization until it reaches a root.

    - the root represents all the infromation of its leaves -- the individual transactions and branches of transactions -- in a relatively short string.

- nBits
    - nBits is the encoded form of the target threshold for a valid block

- nonce
    - nonce is the string num variable incremented by the "proof-of-work"
        - a miner random guesses, using cpu power, a hash that is smaller than the target.
        - a miner has to guess the nonce (million to billion)to solve and provide proof of work to generate a random string for the new block
        - the nonce value is calculated based on the difficulty target per the blockchain.

- timestamp
    - unix timestamps make it difficult for blocks to be manipulated.
    - a timestamp is only valid if it is greater the median of previous 11 blocks.


# wallets

a blockchain wallet is a software program that enables users, to buy, sell, & monitor balance for their digital currency or assets.

wallets are classified as software, hardware, and paper wallet available to store & reflect a transaction on blockchain.
- a wallet stores private and public keys for a transaction.

a wallet can interact with multiple blockchains to validate a transaction that publicly visible.

a wallet can also support multiple currencies.

##### types of wallets:
- hardware wallets are offline wallets stored on desktops or laptops.

- software/online wallets are wallets stored on the cloud and can be accessed through a website.

- paper wallets are wallets using a software application and then printed -- which are great for buying and selling of funds.

    - sweeping is a term to describe scanning a QR code or adding the keys manually.

online wallets can expose users to possible vulnerabilities.

offline wallets cannot be hacked since they are not connected to an online network or rely on a 3rd party.

regardless of which type of wallet used, losing the private keys will result in the loss of the money.

# blockchain address

an address is a placeholder to accept and send blockchain transactions.

- the person that holds a private key for an address is the only one that can sign a transaction for this address.

- anyone that knows the address can verify the signature of the private key without uncovering the private key.

pay-to-public_key_hash became the standard format for bitcoin addresses.

an ECDSA key is used for encrypting blockchain addresses -- an asymptomatic algorithm.

- a type of algorithm to allow transactions to be signed with a private key and the signature is verified with a public key.