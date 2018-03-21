pragma solidity ^0.4.18;

contract MyContract {
    
    string fName;
    uint age;
   
    event TheHuman(
       string name,
       uint age
    );

    function setHuman(string _fName, uint _age) public {
        fName = _fName;
        age = _age;
        emit TheHuman(_fName, _age);
    }
   
    function getHuman() view public returns (string, uint) {
        return (fName, age);
    }
}