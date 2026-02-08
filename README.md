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
# Foundry Testing Quick Guide (README)

This README documents common Foundry testing patterns including assertion labels, event testing, time manipulation, balance utilities, and signing utilities.

---

## ✅ Adding Labels to Assertions

Use labels in assertions to make test failures more readable:

```solidity
function test_ErrorLabels() public {
    assertEq(1, 1, "test 1: basic equality");
    assertEq(1, 1, "test 2: repeat equality");
    assertEq(1, 1, "test 3: invariant holds");
    assertEq(1, 1, "test 4: consistency check");
    assertEq(1, 1, "test 5: final assertion");
}
```

---

## 📢 Testing Emitted Events

### Contract Setup

```solidity
Event public e;

event Transfer(address indexed from, address indexed to, uint256 amount);

function setUp() public {
    e = new Event();
}
```

### Event Test

```solidity
function testEventTransfer() public {
    vm.expectEmit(true, true, false, true);

    emit Transfer(address(this), address(123), 10);

    e.transfer(address(this), address(123), 10);
}
```

### `expectEmit` Flags

```text
vm.expectEmit(
    bool checkTopic1,   // indexed param 1
    bool checkTopic2,   // indexed param 2
    bool checkTopic3,   // indexed param 3
    bool checkData      // non-indexed data
)
```

---

## ⏱️ Time & Block Manipulation

Used for testing vesting, staking, locks, epochs, etc.

```text
vm.warp(timestamp)   → set block.timestamp to future timestamp
vm.roll(blockNumber) → set block.number
skip(seconds)        → increment current timestamp
rewind(seconds)      → decrement current timestamp
```

---

## 💰 Balance & Account Utilities

```text
deal(address, uint256) → set ETH balance of address
hoax(address, uint256) → deal + prank (set balance + msg.sender)
```

---

## 🔐 Signing & Key Utilities

```solidity
contract SignTest is Test {
    // private key = 123
    // public key  = vm.addr(privateKey)
    // message     = "secret message"
    // messageHash = keccak256(bytes(message))
    // signature   = vm.sign(privateKey, messageHash)
}
```

### Flow

```text
1. Generate address from private key → vm.addr(pk)
2. Hash message → keccak256(bytes(msg))
3. Sign hash → vm.sign(pk, hash)
```

---

## 🧪 Common Commands

```bash
forge build                  # compile contracts
forge test -vvv              # run tests with logs
forge test --gas-report       # gas usage report
forge test --match-path test/Hello.t.sol
```

---

## 🛠 Debugging

```solidity
import "forge-std/console.sol";
console.log("debug value", value);
```



