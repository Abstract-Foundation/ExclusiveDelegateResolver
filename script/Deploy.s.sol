// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console, console2} from "forge-std/Script.sol";
import {ExclusiveDelegateResolver} from "../src/ExclusiveDelegateResolver.sol";

interface ImmutableCreate2Factory {
    function safeCreate2(bytes32 salt, bytes calldata initCode) external payable returns (address deploymentAddress);
    function findCreate2Address(bytes32 salt, bytes calldata initCode)
        external
        view
        returns (address deploymentAddress);
    function findCreate2AddressViaHash(bytes32 salt, bytes32 initCodeHash)
        external
        view
        returns (address deploymentAddress);
}

contract Deploy is Script {
    ExclusiveDelegateResolver public resolver;

    bytes32 salt = 0x00000000000000000000000000000000000000003a391ca2ec47aa02ffddcc88; // 0x000000000000F2aA95168C61B2230b07Eb6dB00f

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // deploy resolver

        ExclusiveDelegateResolver resolver = new ExclusiveDelegateResolver{salt: bytes32(0)}();
        console.log("resolver", address(resolver));
        vm.stopBroadcast();
    }
}
