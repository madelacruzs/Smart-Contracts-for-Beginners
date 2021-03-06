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
    
    function setHuman(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        // var human = humans[_address];        
        // human.age = _age;
        // human.fName = _fName;
        // human.lName = _lName;
        
        humans[_address] = Human ({
            age: _age,
            fName: _fName,
            lName: _lName
        });

        humanAccts.push(_address)-1;
        emit humanInfo(_fName, _lName, _age);
    }
    
    function getHumans() view public returns(address[]) {
        return humanAccts;
    }
    
    function getHuman(address _address) view public returns (uint, bytes16, bytes16) {
        return (humans[_address].age, humans[_address].fName, humans[_address].lName);
    }
    
    function countHumans() view public returns (uint) {
        return humanAccts.length;
    }
    
}