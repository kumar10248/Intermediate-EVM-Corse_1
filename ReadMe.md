# ErrorHandling Smart Contract

This Solidity smart contract demonstrates basic error handling using `require`, `revert`, and `assert` statements. It includes functions to set, get, reset, and assert the value of a stored variable.

## Overview

The `ErrorHandling` contract contains the following features:
- Setting a value with a requirement that the value must be greater than zero.
- Retrieving the stored value.
- Resetting the value to zero, with a check to ensure it is not already zero.
- Asserting that the stored value is always non-negative.

## Functions

### `setValue(uint256 val)`

Sets the value of the `value` state variable.

- **Parameters:** 
  - `val` (uint256): The new value to be set. Must be greater than zero.
- **Events:**
  - Emits `ValueChanged(uint256 newValue)` upon successfully setting the value.
- **Error Handling:**
  - Uses `require` to ensure the new value is greater than zero.

### `getValue()`

Returns the current value of the `value` state variable.

- **Returns:**
  - `value` (uint256): The current value.

### `reset()`

Resets the value of the `value` state variable to zero.

- **Events:**
  - Emits `ValueChanged(uint256 newValue)` upon successfully resetting the value.
- **Error Handling:**
  - Uses `revert` to prevent resetting the value if it is already zero.

### `assertFunc()`

Asserts that the current value of the `value` state variable is non-negative.

- **Error Handling:**
  - Uses `assert` to ensure the value is greater than or equal to zero. This should always be true given the logic of the contract.

## Events

### `ValueChanged(uint256 newValue)`

Emitted when the `value` state variable is changed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Deployment

To deploy this contract, use the following configuration:

- **Solidity Version:** 0.8.0 or above

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint256 public value;

    event ValueChanged(uint256 new_Val);

    function setValue(uint256 val) public {
        require(val > 0, "Value must be greater than zero");
        value = val;
        emit ValueChanged(value);
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function reset() public {
        if (value == 0) {
            revert("Value is already zero");
        }
        value = 0;
        emit ValueChanged(value);
    }

    function assertFunc() public view {
        uint256 currentValue = value;
        assert(currentValue >= 0);
    }
}
