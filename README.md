# Smart-Contracts-for-Beginners
Developing Ethereum Smart Contracts for Beginners

##Smart Contract Variables & Types

The most simple concept in any language is the variable. Because Solidity is statically typed (that is, the type of the variable must be defined before compile time), you must specify the type of the variable.

Let's define a string variable in our contract:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string fName = 'Miguel';
    
}
```

In Solidity, you define a variable by first specifying its type.

What other types are there?

* **bool**
  This is a Boolean, which returns true or false.

* **int / uint**
  Both int and uint represent integers, or number values. The primary difference between int and uint (Unsigned Integer), is that int can hold negative numbers as values.

* **address**
  The address type represents a 20 byte value, which is meant to store an Ethereum address. Variables that are typed as address also have members, including balance and transfer.

* **bytes1 through 32**
  This is a fixed-size byte array.

* **bytes**
  A dynamically-sized byte array.

* **string**
  A dynamically signed string.

* **mapping**
  Hash tables with key types and value types. We will look at mappings more in depth later on in the course.

* **struct**
  Structs allow you to define new types. We will also cover this more in depth shortly

 Let's also define my age. No one can have a negative age, so we will use an unsigned integer for this:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string fName = 'Miguel';
   uint age = 18; // :)
    
}
```

## Public and Private
Solidity has four types of visibilities for both functions and variables:

**Public**
This allows you to define functions or variables that can be called internally or through messages.

**Private**
Private variables and functions are only available to the current contract and not derived contracts.

**Internal**
Fuctions and variables that can only be accessed internally (current contract or derived).

**External**
Functions that can be called from other contracts and transactions. They cannot be called internally, except with "this.functionName()".
Let's add the public visibility to our variables:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string public fName = 'Miguel';
   uint public age = 18; // :)
    
}
```

## Smart Contract Constructor
Every smart contract has a constructor function. This constructor is called when a contract is created. Inside of it, you can define the values of variables.

Let's re-adjust our code to work with a constructor:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string public fName;
   uint public age;
   
   function Coursetro() public {
       fName = 'Miguel';
       age = 18;
   }
    
}
```

## Constant Variables
Variables can be declared as being constant. As the name suggests, these are variables with a constant value that does not change.

Let's transform the fName variable to a constant variable:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string constant fName = 'Miguel';
   uint public age;
   
   function Coursetro() public {
       fName = 'Miguel';
       age = 18;
   }
    
}
```

## Setting Variables
Our smart contract at this point is pretty boring. Let's integrate a potential user interaction where we can manually define a Coursetro Instructor's name and age.

Paste the following:


```
pragma solidity ^0.4.18;

contract MMContract {
    
   string fName;
   uint age;
   
   function setInstructor(string _fName, uint _age) public {
       fName = _fName;
       age = _age;
   }
   
   function getInstructor() public constant returns (string, uint) {
       return (fName, age);
   }
    
} 
}
```
