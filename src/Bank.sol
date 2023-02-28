// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

pragma solidity ^0.8.13;
/* 
 * A contract to allow users to deposit and withdraw an ERC20
 */ 
contract Bank{
    address owner = msg.sender;
    IERC20 erc20;

    mapping(address => uint256) balances;

    constructor(address _erc20) {
        erc20 = IERC20(_erc20);
    }

    /*
     * Users can deposit their funds to the bank
     */ 
    function depost(uint256 amount) public {
        balances[msg.sender] += amount;
        IERC20(erc20).transferFrom(msg.sender, address(this), amount);
    }

    /*
     * Users can withdraw their funds from the bank
     */ 
    function withdraw(address to, uint256 amount) public {
        balances[msg.sender] -= amount;
        IERC20(erc20).transferFrom(address(this), to, amount);
    }
}