// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract SimpleLendingPlatform is ReentrancyGuard {
    mapping(address => uint256) public deposits;
    mapping(address => uint256) public borrowings;

    IERC20 public immutable token;
    uint256 public constant INTEREST_RATE = 5; // 5% annual interest rate
    uint256 public constant COLLATERAL_FACTOR = 75; // 75% collateral factor

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event Borrow(address indexed user, uint256 amount);
    event Repay(address indexed user, uint256 amount);

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than 0");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        deposits[msg.sender] += amount;
        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than 0");
        require(deposits[msg.sender] >= amount, "Insufficient balance");
        deposits[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
        emit Withdraw(msg.sender, amount);
    }

    function borrow(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than 0");
        uint256 maxBorrow = (deposits[msg.sender] * COLLATERAL_FACTOR) / 100;
        require(borrowings[msg.sender] + amount <= maxBorrow, "Exceeds allowed borrowing");
        borrowings[msg.sender] += amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
        emit Borrow(msg.sender, amount);
    }

    function repay(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than 0");
        require(borrowings[msg.sender] >= amount, "Repay amount exceeds borrowing");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        borrowings[msg.sender] -= amount;
        emit Repay(msg.sender, amount);
    }

    function calculateInterest(address user) public view returns (uint256) {
        // Simplified interest calculation (assuming 1 year for demonstration)
        return (borrowings[user] * INTEREST_RATE) / 100;
    }
}
