// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftIntegrationsTest is Test {
    MoodNft public moodNft;
    address public USER = makeAddr("user");

    function setUp() public {
        DeployMoodNft deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testChangeMoodIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(USER);
        console.log(msg.sender);
        console.log(moodNft.ownerOf(0));
        // console.log(moodNft.tokenURI(0));
    }

    function testFilpTokenToSad() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
        vm.prank(USER);
        moodNft.flipMood(0);
        console.log(moodNft.tokenURI(0));
    }
}
