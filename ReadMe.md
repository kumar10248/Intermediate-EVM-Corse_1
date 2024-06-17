# ErrorHandling Smart Contract

This project is a simple smart contract implemented on the Ethereum Virtual Machine (EVM) for handling errors.

## Features

- Setting a value
- Getting the current value
- Resetting the value to zero
- Asserting that the current value is non-negative

## Prerequisites

- Solidity ^0.8.0
- Truffle ^5.4.0
- Ganache ^2.5.4

## Installation

1. Clone the repository
2. Install dependencies with `npm install`
3. Start Ganache
4. Compile the contract with `truffle compile`
5. Deploy the contract with `truffle migrate`

## Usage

After deploying the contract, you can interact with it using the Truffle console.

### Setting a Value

To set a value, call the `setValue` function with your desired value as a parameter. The value must be greater than zero.

### Getting the Current Value

To get the current value, call the `getValue` function.

### Resetting the Value to Zero

To reset the value to zero, call the `resetFunc` function. This function will revert if the current value is already zero.

### Asserting that the Current Value is Non-negative

To assert that the current value is non-negative, call the `assertFunc` function. This function should always pass for uint256.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)