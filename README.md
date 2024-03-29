# DegenToken README

This repository contains the source code for the DegenToken smart contract, which is a simple ERC-20 token implemented in Solidity. Below, you will find important information and instructions for using and deploying the contract.

## Contract Overview

The DegenToken is an Ethereum-based ERC-20 token with the following characteristics:

- **Name**: Degen
- **Symbol**: DGN
- **Decimals**: 18
- **Owner**: The owner of the contract has the ability to mint new tokens, burn tokens, transfer tokens, and redeem prizes.

## Getting Started

To get started with the DegenToken smart contract, follow these steps:

2. **Compile**: Compile the smart contract using your chosen development environment to generate the contract ABI and bytecode.

3. **Deploy**: Deploy the contract to an Ethereum testnet or the Ethereum mainnet. The owner of the contract will be the address that deploys it.

4. **Interact**: Once the contract is deployed, you can interact with it using Ethereum wallets, other smart contracts, or through web3.js or ethers.js for programmatic interactions.

## Contract Details

### Functions

- `constructor()`: Initializes the contract with the name "Degen," symbol "DGN," and 18 decimal places. The deployer of the contract becomes the owner.
- 
- `checkBalance()`: check the balances of users account.
- 
- `mint(uint256 _value)`: Allows the owner to mint a specified amount of tokens. The `_value` must be greater than zero.

- `burn(uint256 _value)`: Allows any token holder to burn a specified amount of their tokens. The `_value` must be greater than zero, and the caller must have a sufficient balance.

- `transfer(address _to, uint256 _value)`: Allows token holders to transfer tokens to another address. The `_value` must be greater than zero, and the caller must have a sufficient balance.

- `redeem(string memory _prize, uint256 _cost)`: Allows token holders to redeem prizes by specifying the prize name `_prize` and its associated cost `_cost`. The cost is deducted from the caller's balance, and the prize selection is recorded. An event `Redeem` is emitted to indicate the successful redemption.
