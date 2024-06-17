// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint256 public value;

  
    event ValueChanged(uint256 new_Val);

  // Function to implement the require
    function setValue(uint256 val) public {
        require(val > 0, "Value must be greater than zero");

       
        value = val;

        emit ValueChanged(value);
    }

    
    function getValue() public view returns (uint256) {
        return value;
    }

     // Function to implement the  revert
    function reset() public {
        
        if (value == 0) {
            revert("Value is already zero");
        }

       
        value = 0;

     
        emit ValueChanged(value);
    }

    // Function to implement the assert
    function assertFunc() public view {
      
        uint256 currentValue = value;
        assert(currentValue >= 0); 
    }
}
