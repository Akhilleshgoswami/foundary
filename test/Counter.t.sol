// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    // run every time before runing the test
    function setUp() public {
        counter = new Counter();
    }

    function test_Increment() public {
        counter.inc();
        assertEq(counter.get(), 1);
    }

    function test_RevertWhen_DecUnderflow() public {
        vm.expectRevert();
        counter.dec();
    }

    function test_dec() public {
        counter.inc();
        counter.inc();
        counter.dec();
        assertEq(counter.get(), 1);
    }
}
