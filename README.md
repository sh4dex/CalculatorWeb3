# CalculatorVW3 — Solidity Smart Contract

## Overview

**CalculatorVW3** is a simple smart contract written in Solidity that performs basic arithmetic operations while demonstrating fundamental smart contract development concepts.

The contract stores the result of the last calculation and emits an event for every operation performed. This allows off-chain applications or users to track contract activity.

This project was developed as part of a learning process using the **Foundry** smart contract development framework.

The main objective of this project is to practice and demonstrate core Solidity concepts, including:

* Solidity contract structure
* Events
* Enums
* Modifiers
* State variables
* NatSpec documentation
* Foundry project organization

---

## Contract Features

The contract implements four basic arithmetic operations:

| Operation      | Function           |
| -------------- | ------------------ |
| Addition       | `addition()`       |
| Subtraction    | `subtraction()`    |
| Multiplication | `multiplication()` |
| Division       | `division()`       |

Each operation performs the following steps:

1. Executes the arithmetic calculation
2. Stores the result in the `lastResult` state variable
3. Emits the `OperationPerformed` event to log the transaction
