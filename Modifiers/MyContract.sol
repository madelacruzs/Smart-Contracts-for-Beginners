pragma solidity ^0.4.18;

contract MyContract {
    
    string fName;
    uint age;
    address owner;
   
    function MyContract() public {
        owner = msg.sender;
    }
   
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
   
    event TheHuman(
        string name,
        uint age
    );

    function setHuman(string _fName, uint _age) onlyOwner public {
        fName = _fName;
        age = _age;
        emit TheHuman(_fName, _age);
    }
   
    function getHuman() view public returns (string, uint) {
        return (fName, age);
    }
}