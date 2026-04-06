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

    function testCheckAdmin() public view {
        assert(calculator.owner() == owner);       
    }

    // **********************
    // VALIDATION UNIT TESTS
    // **********************
    function testAddition() public {
        uint256 x_ = 10;
        uint256 y_ = 10;
        assert(calculator.addition(x_, y_) == x_ + y_ );
    }

    function testSubstraction() public {
        uint256 x_ = 10;
        uint256 y_ = 10;
        assert(calculator.subtraction(x_, y_) == x_ - y_ );
    }

    function testMultiplication() public {
        uint256 x_ = 10;
        uint256 y_ = 10;
        assert(calculator.multiplication(x_,y_) == x_ * y_ );
    }

    function testDivision() public {
        uint256 x_ = 10;
        uint256 y_ = 10;
        assert(calculator.division(x_, y_) == x_ / y_ );
    }

    // Permission address

    function testPowerUserNotAllowed() public{
        uint256 x_ = 5;
        uint256 y_ = 2;
        vm.startPrank(normalUser);
        vm.expectRevert();
        calculator.power(x_,y_);
        vm.startPrank(normalUser);
    }

    function testPowerUserAuthorized() public {
        uint256 x_ = 5;
        uint256 y_ = 2;
        vm.startPrank(owner);
        assert(calculator.power(x_,y_) == x_ ** y_);
        vm.startPrank(owner);
    }

    // ******************
    // REVERT UNIT TESTS
    // ******************
    function testDivisionByZero() public{
        uint256 x_ = 10;
        uint256 y_ = 0;
        vm.expectRevert();
        calculator.division(x_, y_);

    }

    function testVeryLargeNumberMultiplication() public{
        uint256 x_ = type(uint256).max;
        uint256 y_ = 2;
        vm.expectRevert();
        calculator.multiplication(x_,y_);
    }

}