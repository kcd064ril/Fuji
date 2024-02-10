// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public reward;
    mapping(address => uint256) public balanceOf;

    bool public rewardReceived;

    constructor() {
        owner = msg.sender;
        name = "Degen";
        symbol = "DGN";
        decimals = 18;
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

    function redeem( uint256 _cost) external {
        require(balanceOf[msg.sender] >= _cost, "low balance");
        require(_cost > 0, "bad value");
        balanceOf[msg.sender] -= _cost;
        reward[msg.sender] = _cost;

        rewardReceived = true;
    }
}
