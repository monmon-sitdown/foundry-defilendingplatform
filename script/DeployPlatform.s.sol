// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {SimpleLendingPlatform} from "src/Defilending.sol";
import {LendingToken} from "src/LendingToken.sol";

contract DeployPlatform is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        LendingToken tokenA = new LendingToken(1000 * 10 ** 18);
        // 部署 DEXPlatform 合约
        SimpleLendingPlatform platform = new SimpleLendingPlatform(address(tokenA));

        // 输出部署后的合约地址
        console.log("TokenA deployed to:", address(tokenA));
        console.log("SimpleLendingPlatform deployed to:", address(platform));

        vm.stopBroadcast();
    }
}

/**
 * TokenA deployed to: 0x36bFCebFfcAac1E6d6C2Dc39f2C7a2190359754B
 *   SimpleLendingPlatform deployed to: 0x94f394Db5e958E296670BF494c723B6fab52d3fD
 */
