//SPDX-License-Identifier:MIT

pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {CalculatorVW3} from "../src/CalculatorVW3.sol";

contract CalculatorTestVW3 is Test{

    CalculatorVW3 calculator;
    address owner = vm.addr(1);

    function setUp() public {
        calculator = new CalculatorVW3(owner);
    }

    function testCheckAdmin() public view {
        assert(calculator.owner() == owner);       
    }

}