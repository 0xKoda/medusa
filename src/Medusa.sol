// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "lib/murky/src/Merkle.sol";

contract Medusa {
    Snakes snakes;
    struct Snakes {
    bytes32 root;
    bytes32 head;
    }
    address owner;
    Merkle merkle;
    uint256 nonce;

    mapping(address => uint256) web; //Map address to CID
    // mapping(uint256 => uint256) dag; //Map dag root to top CID
    event newHead(bytes32);
    event newRoot(bytes32);

    constructor(){
        owner = msg.sender;
        snakes.root = 0;
        merkle = new Merkle();
        nonce = 0;
    }


// state changers
//set new root
    function sR(bytes32 i) public {
        snakes.root = i;
        emit newRoot(i);
    }
//attatch new head
    function setFirst(address i) public {
        require(snakes.root != 0 && nonce == 0, "initialize root");
        bytes32 b = bytes32(uint256(uint160(address(i))));
        bytes32 h = merkle.hashLeafPairs(b, snakes.root);
        nonce++;
        emit newHead(h);
    }
//add new address to stone
    function add(address u) public{
        bytes32 b = bytes32(uint256(uint160(address(u))));
        bytes32 n = merkle.hashLeafPairs(b, snakes.head);
        snakes.head = n;
        nonce++;
    }

    /* public endpoints */

//search her head
    function _sh(address c) public view returns(bool){
        
    }
}
