# EVM Twitter Clone

This project is a simple Twitter clone implemented on the Ethereum Virtual Machine (EVM).

## Features

- Tweeting
- Liking tweets
- Deleting tweets

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

### Tweeting

To tweet, call the `tweet` function with your message as a parameter.

### Liking a Tweet

To like a tweet, call the `likeTweet` function with the index of the tweet you want to like.

### Deleting a Tweet

To delete a tweet, call the `deleteTweet` function with the index of the tweet you want to delete.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)