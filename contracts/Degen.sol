// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DegenToken {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // Reward COST
    uint256 public constant SPECIAL_ITEM_COST = 100;
    uint256 public constant MEDIUM_REWARD_COST = 50;
    uint256 public constant BASIC_REWARD_COST = 10;


// Reward AMOUNT
uint256 public constant SPECIAL_REWARD_AMOUNT = 50; 
    uint256 public constant MEDIUM_REWARD_AMOUNT = 20; 
    uint256 public constant BASIC_REWARD_AMOUNT = 5;  

    mapping(address => uint256) public reward;
    mapping(address => uint256) public balanceOf;

    bool public rewardReceived;

IERC20 public KCT;
    constructor(address _k6tAddress) {
        owner = msg.sender;
        name = "Degen";
        symbol = "DGN";
        decimals = 18;

        KCT = IERC20(_k6tAddress);
    }

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function checkBalance(address _address) external view returns (uint256) {
        return balanceOf[_address];
    }

    function mint(uint256 _value) external onlyOwner returns (bool success) {
        require(_value > 0, "Invalid value");
        balanceOf[msg.sender] += _value;
        totalSupply += _value;
        return true;
    }

    function burn(uint256 _value) external returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient funds");
        require(_value > 0, "Invalid value");
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        return true;
    }

    function transfer(address _to, uint256 _value) external returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "low balance");
        require(_value > 0, "bad value");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        return true;
    }


      function redeem(uint256 _cost) external {
        require(balanceOf[msg.sender] >= _cost, "Insufficient balance");
        require(_cost > 0, "Invalid cost");

        balanceOf[msg.sender] -= _cost;
        reward[msg.sender] += _cost;

        if (_cost >= SPECIAL_ITEM_COST) {
            KCT.transfer(msg.sender,SPECIAL_REWARD_AMOUNT);
        } else if (_cost >= MEDIUM_REWARD_COST) {
            
            KCT.transfer(msg.sender, MEDIUM_REWARD_AMOUNT);
        } else if (_cost >= BASIC_REWARD_COST) {
            
            KCT.transfer(msg.sender, BASIC_REWARD_AMOUNT);
        } else {
         
            revert("Amount not sufficient for redemption");
        }

        rewardReceived = true;
    }

 

}
