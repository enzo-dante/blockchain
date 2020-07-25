pragma solidity ^0.4.25; // compiler version

// smart contracts are the implementation of policies for transfer of assets in a decentralized network.
contract ZombieFactory {

    // Events are a way for your contract to communicate that something happened on the blockchain to your app front-end
    event NewZombie(uint zombieId, string name, uint dna);

    // uint 256 data type
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // struct is an object
    struct Zombie {
        string name;
        uint dna;
    }

    // a dymanic array of Zombie objects that are publically accessible, named zombies
    Zombie[] public zombies;

    // nameing convention of underscore emphasizes private function
    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        // events can be 'listening' for certain events and take action when they happen for logging purposes
        emit NewZombie(id, _name, _dna);
    }

    // view: only viewing the data not modifying it
    function _generateRandomDna(string _str) private view returns (uint) {
        // we have to typecast string into a uint256
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
