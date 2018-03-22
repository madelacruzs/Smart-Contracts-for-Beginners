pragma solidity ^0.4.18;

contract MyContract {
    
    string public fName;
    uint public age;

    function setHuman(string _fName, uint _age) public {
        fName = _fName;
        age = _age;
    }
   
    function getHuman() view public returns (string, uint) {
        return (fName, age);
    }
}

