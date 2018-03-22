pragma solidity ^0.4.18;

contract Owned {
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract MyContract is Owned {
    
    struct Human {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    
    mapping (address => Human) humans;
    address[] public humanAccts;
    
    event humanInfo(
       bytes16 fName,
       bytes16 lName,
       uint age
    );
    
    function setInstructor(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        var instructor = humans[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        humanAccts.push(_address) -1;
        humanInfo(_fName, _lName, _age);
    }
    
    function getInstructors() view public returns(address[]) {
        return humanAccts;
    }
    
    function getInstructor(address _address) view public returns (uint, bytes16, bytes16) {
        return (humans[_address].age, humans[_address].fName, humans[_address].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return humanAccts.length;
    }
    
}