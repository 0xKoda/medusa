// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Surl} from "surl/Surl.sol";
import "../src/Medusa.sol";

contract MedusaScript is Script {
    using Surl for *;
    // Medusa medusa ;
    
    function run() external {
         vm.startBroadcast();
        (uint256 status, bytes memory data) = "https://tutela.xyz/search?address=0xdd140cb2847f6186a9df3b25ae1e135052b09321".get();
        // bytes memory res = cluster;
        console.log("status", status);
        console.log("data", string(data));
        vm.stopBroadcast();
    }
}


