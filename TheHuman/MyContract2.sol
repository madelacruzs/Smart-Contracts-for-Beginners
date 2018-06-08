pragma solidity ^0.4.21;

contract MyContract {
    
    struct Human {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Human) humans;
    address[] public humanAccts;
    
    event humanInfo(
       string fName,
       string lName,
       uint age
    );
    
    function setHuman(address _address, uint _age, string _fName, string _lName) public {
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
    
    function getHuman(address _address) view public returns (uint, string, string) {
        return (humans[_address].age, humans[_address].fName, humans[_address].lName);
    }
    
    function countHumans() view public returns (uint) {
        return humanAccts.length;
    }
    
}