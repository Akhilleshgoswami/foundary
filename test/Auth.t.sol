pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    address owner = address(0x1);
    address user1 = address(0x2);

    function setUp() public {
        wallet = new Wallet();

        // assume deployer is owner, or explicitly set
        vm.prank(address(this));
        wallet.setOwner(owner);
    }

    function test_SetOwner() public {
        vm.prank(owner);
        wallet.setOwner(user1);
        assertEq(wallet.owner(), user1);
    }

    function test_RevertIf_CallerIsNotOwner() public {
        vm.prank(user1); // not owner
        vm.expectRevert(); // expect revert
        wallet.setOwner(user1);
    }
}

