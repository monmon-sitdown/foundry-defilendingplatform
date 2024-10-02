# Simple Lending Platform

## Overview

The **Simple Lending Platform** is a decentralized application (DApp) built on the Ethereum blockchain that allows users to deposit tokens, borrow against their deposits, and repay borrowed amounts with interest. The platform leverages the ERC20 token standard and employs a reentrancy guard to ensure secure interactions.

## Features

- **Deposits**: Users can deposit ERC20 tokens into the platform, which are then tracked as deposits.
- **Withdrawals**: Users can withdraw their deposited tokens at any time, subject to available balance.
- **Borrowing**: Users can borrow tokens against their deposits based on a defined collateral factor, allowing for leveraged borrowing.
- **Repayment**: Borrowed amounts can be repaid, allowing users to settle their debts and reclaim their collateral.
- **Interest Calculation**: The platform applies a fixed annual interest rate to borrowed amounts.

## Key Parameters

- **Interest Rate**: The platform charges a 5% annual interest rate on borrowed amounts.
- **Collateral Factor**: The collateral factor is set to 75%, meaning users can borrow up to 75% of their deposited amount.

## Usage

1. **Deposit Tokens**: Users can deposit their tokens by specifying an amount. The tokens will be transferred from the user's wallet to the platform's contract.
2. **Withdraw Tokens**: Users can withdraw tokens they previously deposited, given that their withdrawal amount does not exceed their balance.
3. **Borrow Tokens**: Users can borrow tokens up to the maximum allowed, which is determined by their collateralized deposits.
4. **Repay Loans**: Users can repay borrowed tokens, reducing their outstanding debt.

## Installation and Setup

To deploy and interact with the Simple Lending Platform, ensure you have the following prerequisites:

- Install Foundry
- Solidity: Version 0.8.20 or higher
- OpenZeppelin Contracts: For secure smart contract development

### Getting Started

1. **Clone the repository**

```
git clone https://github.com/monmon-sitdown/SimpleDefiLendingPlatform.git
cd SimpleDefiLendingPlatform
```

2. **Install Dependencies**:
   Make sure you have Foundry installed. Then run:

```
forge install
```

### Deployment

#### LendingToken Contract

An ERC20 token contract named **LendingToken (LTK)** is deployed on the network for testing. This token allows users to mint new tokens and facilitates the lending operations within the platform. The LendingToken contract includes:

- **Minting Functionality**: Users can mint new tokens to their addresses.
- **Initial Supply**: The contract is initialized with a specified supply.

#### SimpleLendingPlatform Contract

The main lending contract is designed to manage user deposits, borrowing limits, and interest calculations.

### Testing

The contracts can be tested using Foundry's testing framework.
