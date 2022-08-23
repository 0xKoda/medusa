// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Medusa {
    address owner;
    uint256 root;
    uint256 head;

    mapping(address => uint256) web; //Map address to CID
    // mapping(uint256 => uint256) dag; //Map dag root to top CID
    event newHead(uint256);
    event newRoot(uint256);

    constructor(){
        owner = msg.sender;
        root = 0;
    }

// state changers
//set new root
    function sR(uint256 i) public returns(uint256){
        root = i;
        emit newRoot(i);
        return i;
    }
//attatch new head
    function sH(uint256 i) public returns(uint256){
        require(root != 0, "cant attatch head without root");
        head = i;
        emit newHead(i);
        return i;

    }
//add new address to stone
    function add(address u, uint256 cid) public{
        web[u] = cid;
    }

    // public endpoints 

//search web
    function _sw(address c) public view returns(bool){
        return web[c] > 0 ? true : false;
    }
}
