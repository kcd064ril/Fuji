// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KC064RIL is ERC20 {
    constructor() ERC20("KC064RIL","K6T") {
        _mint(address(this), 1000); 
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(address(this)) >= amount, "contract balance is low");
        _transfer(address(this), recipient, amount);
        return true;
    }
}
