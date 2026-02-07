pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {Auction} from "../src/Timer.sol";

contract TestTime is Test {
    Auction public e;
    uint256 private startAt;

    function setUp() public {
        e = new Auction();
        startAt = block.timestamp;
    }

    function test_Bid_RevertIf_Before_Start_Time() public {
        vm.expectRevert(bytes("cannot bid"));
        e.bid();
    }

    function test_bid() public {
        vm.warp(startAt + 1 days);
        e.bid();
    }

    function test_end_RevertIf_After_End_Time() public {
        vm.warp(startAt);
        vm.expectRevert(bytes("cannot end"));
        e.end();
    }
    function testTimestamp() public {
        uint256 t = block.timestamp;
        // set block.timestamp to t + 100
        skip(100);
        assertEq(block.timestamp, t + 100);

        // set block.timestamp to t + 100 - 100;
        rewind(100);
        assertEq(block.timestamp, t);
    }

    function testBlockNumber() public {
        uint256 b = block.number;
        // set block number to 11
        vm.roll(11);
        assertEq(block.number, 11);
    }

}
