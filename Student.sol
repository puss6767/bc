// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string public name;
    uint public age;

    function setStudent(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }

    function getStudent() public view returns (string memory, uint) {
        return (name, age);
    }
}
