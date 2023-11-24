// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft private deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testSvgToImageURI() public view {
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="200"><rect width="100%" height="100%" fill="#3498db" /><text x="50%" y="50%" alignment-baseline="middle" text-anchor="middle" fill="#ffffff" font-size="20">Hello, SVG!</text></svg>';
        string
            memory expectStr = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMDAiIGhlaWdodD0iMjAwIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjMzQ5OGRiIiAvPjx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBhbGlnbm1lbnQtYmFzZWxpbmU9Im1pZGRsZSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iI2ZmZmZmZiIgZm9udC1zaXplPSIyMCI+SGVsbG8sIFNWRyE8L3RleHQ+PC9zdmc+Cg==";
        string memory actualUrl = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUrl)) ==
                keccak256(abi.encodePacked(expectStr))
        );
    }
}
