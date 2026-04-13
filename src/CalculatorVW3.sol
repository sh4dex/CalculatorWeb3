//SPDX-License-Identifier:MIT

pragma solidity ^0.8.30;

/**
 * @title Calculator W3
 * @author Sh4dex
 * @notice Performs main arithmetic operations
 * @dev stores the last result and emit events for every single operation
 */
contract CalculatorVW3 {
    /// @notice Stores the last result calculated
    uint256 public lastResult;
    address public owner;

    /// @notice Stores operation types
    enum Operation {
        ADDITION,
        SUBTRACTION,
        MULTIPLICATION,
        DIVISION,
        POWER
    }

    constructor(address owner_) {
        owner = owner_;
    }

    /**
     * @dev basic access control system made from scratch
     */
    modifier onlyAdmin() {
        _onlyAdmin();
        _;
    }

    /**
     * @notice prevents Underflow
     * @param minuend_ bigger number
     * @param subtrahend_ Smaller number
     * @dev modifier calls {_ensureNoUnderflow} function
     */
    modifier ensureNoUnderflow(uint256 minuend_, uint256 subtrahend_) {
        _ensureNoUnderflow(minuend_, subtrahend_);
        _;
    }

    /**
     * @dev This function reverts if the user tries to perform a substraction
     * of a bigger number to a smaller amount. Since we are working with
     * unsigned integers.
     * @param minuend_ bigger number
     * @param subtrahend_ Smaller number
     */
    function _ensureNoUnderflow(uint256 minuend_, uint256 subtrahend_) internal pure {
        require(minuend_ >= subtrahend_, "Can't substract a number bigger than the other!");
    }

    /**
     * @notice Control division by Zero
     * @notice Checks if the divisor of a division is zero
     * @dev this modifer calls function {_divisionByZero}
     */
    modifier divisionByZero(uint256 divisor_) {
        _divisionByZero(divisor_);
        _;
    }

    /**
     * @dev Access control function to allow only Admin to execute this
     * functions otherwise, reverts
     */
    function _onlyAdmin() internal view {
        require(owner == msg.sender, "Only owner!");
    }

    /**
     * @notice Reverts if the divisor of a division is zero
     * @param divisor_ Divisor of the operation
     */
    function _divisionByZero(uint256 divisor_) internal pure {
        if (divisor_ == 0) revert();
    }

    /// @notice Emitted event after calculation
    event OperationPerformed(address indexed user, Operation operation, uint256 x, uint256 y, uint256 result);

    /**
     * @notice Subtract two numbers
     * @param minuend_ the number
     * @param subtrahend_ the num
     * @return substraction of minuend_ and  subtrahend_
     */
    function subtraction(uint256 minuend_, uint256 subtrahend_)
        public
        ensureNoUnderflow(minuend_, subtrahend_)
        returns (uint256 result_)
    {
        result_ = minuend_ - subtrahend_;

        lastResult = result_;
        emit OperationPerformed(msg.sender, Operation.SUBTRACTION, minuend_, subtrahend_, result_);
    }

    /**
     * @notice Sums two numbers
     * @param addend1_ first amount
     * @param addend2_ second amount
     * @return the sum of added1_ and added2_
     */
    function addition(uint256 addend1_, uint256 addend2_) public returns (uint256 result_) {
        result_ = addend1_ + addend2_;

        lastResult = result_;
        emit OperationPerformed(msg.sender, Operation.ADDITION, addend1_, addend2_, result_);
    }

    /**
     * @notice Perform the addition of two numbers
     * @param multiplier_ the first Factor
     * @param multiplicand_ the second Factor
     * @return result_ The multiplication of multiplier_ and multiplicand_
     */
    function multiplication(uint256 multiplier_, uint256 multiplicand_) public returns (uint256 result_) {
        result_ = multiplier_ * multiplicand_;

        lastResult = result_;
        emit OperationPerformed(msg.sender, Operation.MULTIPLICATION, multiplier_, multiplicand_, result_);
    }

    /**
     * @notice Performs the division of two numbers
     * @dev Reverts divisions by zero (divisor_ = 0)
     * @param dividend_ number being divided
     * @param divisor_ fraction to divide
     * @return result_ Returns division of dividend_ and divisor_ Rounded to lowest number
     */
    function division(uint256 dividend_, uint256 divisor_) public divisionByZero(divisor_) returns (uint256 result_) {
        result_ = dividend_ / divisor_;

        lastResult = result_;
        emit OperationPerformed(msg.sender, Operation.DIVISION, dividend_, divisor_, result_);
    }

    /**
     * @notice Perfom power operation of two numbers
     * @param base_
     * @param power_
     * @dev only admin can execute this function
     */
    function power(uint256 base_, uint256 power_) external onlyAdmin returns (uint256 result) {
        result = base_ ** power_;
        lastResult = result;
        emit OperationPerformed(msg.sender, Operation.POWER, base_, power_, result);
    }
}
