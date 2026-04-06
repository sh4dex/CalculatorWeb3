//SPDX-License-Identifier:MIT

pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {CalculatorVW3} from "../../src/CalculatorVW3.sol";

contract CalculatorTestVW3 is Test{

    CalculatorVW3 calculator;
    address owner = vm.addr(1);
    address normalUser = vm.addr(2);

    function setUp() public {
        calculator = new CalculatorVW3(owner);
    }

    //fuzzing testing
    function testFuzzingDivision(uint256 x_, uint256 y_) public {
        vm.assume(y_ != 0);
        assertEq(calculator.division(x_, y_), x_ / y_);
    }

    function testFuzzingMultiplication(uint256 x_, uint256 y_) public {
        vm.assume(y_ == 0 || x_ <= type(uint256).max / y_);
        assertEq(calculator.multiplication(x_, y_), x_ * y_);
    }

    function testFuzzingAddition(uint256 x_, uint256 y_) public {
        vm.assume(x_ <= type(uint256).max - y_);
        assertEq(calculator.addition(x_, y_), x_ + y_);
    }

    function testSubstraction(uint256 x_, uint256 y_) public {
        vm.assume(x_ >= y_ );
        assertEq(calculator.subtraction(x_, y_), x_ - y_);
    }
}