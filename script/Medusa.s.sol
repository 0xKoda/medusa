// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Surl} from "surl/Surl.sol";
import "../src/Medusa.sol";

contract MedusaScript is Script {
    using Surl for *;

    function setUp() public {}

    function run() public {
        (uint256 status, bytes memory data) = "https://jsonplaceholder.typicode.com/todos/1".get();

        console.log("status", status);
        console.log("data", string(data));
    }
}


