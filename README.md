 forPerfect — here’s a **clean, professional `README.md`** you can directly paste into your repo 👇
(short, crisp, dev-friendly)

---

# 🧪 Foundry (Forge) Testing Guide

A simple reference for compiling, testing, and debugging Solidity smart contracts using **Foundry (Forge)**.

---

## 📦 Build Contracts

Compile all smart contracts:

```bash
forge build
```

---

## 🧪 Run Tests

Run all tests:

```bash
forge test
```

Run with verbose logs:

```bash
forge test -vvv
```

---

## 🎯 Run Specific Test File

```bash
forge test --match-path test/Hello.t.sol
```

---

## 🔁 Setup Hook

Runs before every test:

```solidity
function setUp() public {
    counter = new Counter();
}
```

---

## ⛽ Gas Report

```bash
forge test --gas-report
```

---

## 🐛 Debugging (Console Logs)

```solidity
import "forge-std/console.sol";

console.log("Hello world");
```

---

## 🎭 Mock Caller (Prank)

```solidity
vm.startPrank(user);
// calls executed as `user`
vm.stopPrank();
```

---

## ❌ Test Reverts

### Require Message

```solidity
function test_Required_Message() public {
    vm.expectRevert(bytes("not authorized"));
    err.throwError();
}
```

### Custom Error

```solidity
function test_Custom_Error() public {
    vm.expectRevert(Error.NotAuthorized.selector);
    err.throwCustomError();
}
```

---

## 🛠 Tools Used

* **Foundry**
* **Forge**
* **forge-std**

---
just to add labels to assertions (and nothing else),
function test_ErrorLabels() public {
    assertEq(1, 1, "test 1: basic equality");
    assertEq(1, 1, "test 2: repeat equality");
    assertEq(1, 1, "test 3: invariant holds");
    assertEq(1, 1, "test 4: consistency check");
    assertEq(1, 1, "test 5: final assertion");
}

testing event emited : 
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);


    function setUp() public {
        e = new Event();
    }
    function testEventTransfer()public{
     
     vm.expectEmit(true, true, false, true);
    
     emit Transfer(address(this), address(123), 10);

     e.transfer(address(this),address(123),10);
    }

timer incress for time contrac testing --> 

vm.wrap() -  set block.timestamp to futuer timestamp 
vm.roll()  - set block number 
skip() - increment current timestamp 
rewind() decreate ment current timestamp
