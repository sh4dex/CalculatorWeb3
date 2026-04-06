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

    //TODO: Write unit test for every single  OPERATION

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

    //TODO: use address for owner access control testing
    //coverage 70% >


//     function testPower() public{
//         uint256 x_ = 7;
//         uint256 y_ = 2;
//         assert(calculator.power(x_,y_) == x_ * y_ );
//     }
// }