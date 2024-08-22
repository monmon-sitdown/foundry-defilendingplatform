// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {LendingToken} from "src/LendingToken.sol";

contract DeployToken is Script {
    function run() external {
        // 部署合约
        vm.startBroadcast();

        // 输出部署后的合约地址
        // console.log("LendingToken deployed to:", address(tokenA));

        vm.stopBroadcast();
    }
}
