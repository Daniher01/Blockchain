// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Ownable.sol";

contract MessageStore is Ownable {
    
    string private message;
    
    //modifica el mensaje por el mensaje ingresado 
    function setMessage(string memory newMessage) public payable  {
        require(msg.value == 3 ether);
        message = newMessage;
    }
    
    //muestra el mensaje
    function getMessage() public view returns (string memory) {
        return message;
    }
    // muestra balance del contrato en wei
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    // muestra balance del contrato en ether
    function getBalanceInEther() public view returns (uint) {
        return getBalance() / 1e18;
    }
    //solo el propietario puede transferir del contrato a su cuenta
    function transfer(uint amount) public isOwner {
        require(address(this). balance >= amount);
        payable(owner).transfer(amount);
    }
    //solo el propietario puede transferir a otra cuenta
    function transferTo(uint amount, address payable to) public isOwner {
        require(address(this). balance >= amount);
        require(to != address(0));
        to.transfer(amount);
    }

}