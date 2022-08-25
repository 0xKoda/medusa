// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Surl} from "surl/Surl.sol";
import "../src/Medusa.sol";

contract MedusaScript is Script {
    using Surl for *;
    Medusa medusa;
    // Medusa medusa ;
    function setUp() external{
        medusa = new Medusa();
        medusa.sR(0x0);
        medusa.setFirst(address(this));
    }
    function run() external {
         vm.startBroadcast();
        (uint256 status, bytes memory data) = "https://tutela.xyz/search?address=0xdd140cb2847f6186a9df3b25ae1e135052b09321".post();
        // bytes memory res = cluster;
        [] = data.data.cluster();
        r = address[];
        
        if(arr[].lenght > 0){
            i = arr[].length;
            for(i > 0; i != 0; i++ ){
                r.push(arr[i].address);
            }
        }
        console.log("status", status);
        console.log("data", string(r[0]));
        medusa.add(0xf5882630bDF17Fae3e4c5c43076636a44281c8E1);
        vm.stopBroadcast();
    }
}


