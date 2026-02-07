// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function test_RevertIf_Not_Authorized() public {
        vm.expectRevert();
        err.throwError();
    }

    function test_Required_Message() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    function test_Custome_Message() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }
}
