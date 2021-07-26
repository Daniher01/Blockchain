// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MessageStore {
    
    address private onwer;
    string private message;
    
    constructor()  {
        onwer = msg.sender;
    }
    
    //modifica el mensaje por el mensaje ingresado 
    function setMessage(string memory newMessage) public isOnwer {
        message = newMessage;
    }
    
    //muestra el mensaje
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    //decora el metodo que no puede ser ejecutaado si no es el propietario el que hace la transaccion
    modifier isOnwer() {
        require(onwer == msg.sender);
        _; //necesario en los modifier
    }

}