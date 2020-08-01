# peer-to-peer network

a p2p network is a group of devices that collectively store and share files.
- each node serves as an individual peer with equal power and performs the same tasks.

each peer in a p2p network holds a copy of the files and acts as both a client and server to other nodes.
- each node can download files from other nodes or upload files to them.

in a centralized network, a client would ONLY download files from a single server -- which is the opposite of a p2p network.

![](../../imgs/p2p-network.png)

p2p networks are not secure and are best at serving a small group of users on a private network.
- p2p networks dont have a single point of failure though and are generally pretty fast.

# p2p architecture

##### unstructured p2p

p2p unstructured architecture means that the nodes aren't deliberately organized and communicate randomly with one another.
- the randomness though requires high cpu usage for querying.

##### structured p2p

p2p structure is an organized design that allows for precision querying that use hash functions for database lookups.
- stuctured p2p require higher maintenance due to higher centralization.

##### hybrid p2p

a combination of stucture and unstructured p2p design


# blockchain - distributed p2p network

in blockchain, each participant within the network maintains, approves, and updates new entries.
- each node carries a copy of the blockchain

since the blockchain is contained on each node, it protects it from a distributed denial of service attack (DDOS)

blockchain is an example of a Byzantine fault tolerance system which is able to continue operating even if some of the nodes fail or act maliciously.

despite adding high security, adding a transaction on each node in blockchain requires high computational power.


