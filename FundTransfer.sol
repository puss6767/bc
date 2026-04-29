// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundTransfer{
    address public owner;

    mapping (address => uint256) public balances;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value >0, "Must send more than Zero");
        balances[msg.sender]+=msg.value;
    }

    function transfer(address recipient, uint256 amount) public{
        require(recipient!=address(0), "Invalid address");
        require(amount>0,"Amount must be greater than zero");
        require(balances[msg.sender] >= amount,"Insufficient balance");

        balances[msg.sender] -= amount;
        balances[recipient] +=amount;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0,"Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value:amount}("");
        require(success,"Withdrawl Failed");
    }
}
