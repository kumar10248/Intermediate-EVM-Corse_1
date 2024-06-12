// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingDemo {
    uint256 public value;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function to set a value with a requirement check
    function setValue(uint256 _value) public {
        // Ensure the sender is the owner
        require(msg.sender == owner, "Only the owner can set the value.");
        
        // Ensure the value is greater than zero
        require(_value > 0, "Value must be greater than zero.");

        value = _value;
    }

    // Function to increment value with an assertion check
    function incrementValue() public {
        // Ensure the value has been set before incrementing
        assert(value > 0);
        
        value += 1;
    }

    // Function that reverts the transaction if the value is not set
    function resetValue() public {
        if (value == 0) {
            revert("Value is already zero.");
        }

        value = 0;
    }
}
