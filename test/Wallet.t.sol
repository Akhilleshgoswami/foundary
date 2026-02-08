pragma solidity 0.8.26;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Wallet} from "../src/Wallet.sol";

contract WalletTest is Test {

 Wallet public wallet;

 function setUp()public {
  wallet = new Wallet();
 }

 
 function _send(uint256 amount) private {
  (bool ok,) = address(wallet).call{value:amount}("");
  require(ok,"send eth failed");
 }
 function testEthBalance()public {
  console.log("ETH balance",address(this).balance/1e18);
 }

 function testSendEth()public{
         uint256 bal = address(wallet).balance;
  // set the balance of an address
deal(address(1),100);
assertEq(address(1).balance, 100);
    // hoax = deal + prank
        deal(address(1), 123);
        vm.prank(address(1));
        _send(123);
        hoax(address(1), 456);
        _send(456);

        assertEq(address(wallet).balance, bal + 123 + 456);
 }
     function test_Revert_If_WithdrawNotOwner() public {
        vm.prank(address(1));
        vm.expectRevert();
        wallet.withdraw(1);
    }

}
