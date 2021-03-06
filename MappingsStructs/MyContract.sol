pragma solidity ^0.4.18;

contract MyContract {
    
    struct TheHuman {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => TheHuman) humanes;
    address[] public humanAccts;
    
    function setHuman(address _address, uint _age, string _fName, string _lName) public {
        var thehuman = humanes[_address];
        
        thehuman.age = _age;
        thehuman.fName = _fName;
        thehuman.lName = _lName;
        
        humanAccts.push(_address)-1;
    }
    
    function getHumans() view public returns(address[]) {
        return humanAccts;
    }
    
    function getHuman(address _address) view public returns (uint, string, string) {
        return (humanes[_address].age, humanes[_address].fName, humanes[_address].lName);
    }
    
    function countHumans() view public returns (uint) {
        return humanAccts.length;
    }
    
}