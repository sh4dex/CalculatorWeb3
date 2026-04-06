# 🧮 CalculatorVW3

## 📌 Overview

**CalculatorVW3** is a smart contract written in Solidity that performs basic arithmetic operations while showcasing fundamental smart contract development concepts.

The contract keeps track of the most recent calculation result and emits an event for every operation executed. This enables off-chain applications and users to easily monitor contract activity.

This project was built using the **Foundry** smart contract development framework.

## 🎯 Objectives

This project demonstrates and practices core Solidity concepts, including:

* Smart contract structure
* Events
* Enums
* Modifiers
* State variables
* NatSpec documentation
* Foundry project organization
* Unit testing

---

## ⚙️ Contract Features

The contract supports the following arithmetic operations:

| Operation      | Function Name      |
| -------------- | ------------------ |
| Addition       | `addition()`       |
| Subtraction    | `subtraction()`    |
| Multiplication | `multiplication()` |
| Division       | `division()`       |
| Power          | `power()`          |

Power function uses a basic access control system, *owner address is required*.

### 🔄 Execution Flow

Each function follows the same workflow:

1. Performs the arithmetic operation
2. Stores the result in the `lastResult` state variable
3. Emits the `OperationPerformed` event

---

## 🧪 Testing

All unit tests are located in the `/test` directory and cover every operation implemented in the contract.

### ✅ Test Results

```
Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 3.68ms (5.90ms CPU time)

Ran 1 test suite in 26.87ms (3.68ms CPU time):
9 tests passed, 0 failed, 0 skipped (9 total tests)
```

---

## 📊 Coverage Report

```
╭-----------------------+-----------------+-----------------+---------------+-----------------╮
| File                  | % Lines         | % Statements    | % Branches    | % Funcs         |
+=============================================================================================+
| src/CalculatorVW3.sol | 100.00% (30/30) | 100.00% (21/21) | 100.00% (3/3) | 100.00% (10/10) |
|-----------------------+-----------------+-----------------+---------------+-----------------|
| Total                 | 100.00%         | 100.00%         | 100.00%       | 100.00%         |
╰-----------------------+-----------------+-----------------+---------------+-----------------╯
```

---

## 📁 Project Structure

```
├── src/
│   └── CalculatorVW3.sol
├── test/
│   └── CalculatorVW3.t.sol
├── script/
├── foundry.toml
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

Install Foundry:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Build

```bash
forge build
```

### Test

```bash
forge test
```

---

## 📜 License

This project is licensed under the MIT License.


