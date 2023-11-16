// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import {Test} from 'forge-std/Test.sol';
import {DeployBasicNft} from '../script/DeployBasicNft.s.sol';
import {BasicNft} from '../src/BasicNft.sol';

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;


    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() view public {
        string memory tokenName = basicNft.name();
        string memory exceptName = "FFEIG";
        bytes32 tokenNameHash = keccak256(abi.encodePacked(tokenName));
        bytes32 exceptNameHash = keccak256(abi.encodePacked(exceptName));
        assert(tokenNameHash == exceptNameHash);
    }
}