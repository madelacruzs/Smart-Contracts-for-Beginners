
# Developing Ethereum Smart Contracts 

## Smart Contract Variables & Types

El concepto más simple en cualquier idioma es la variable. Debido a que Solidity está tipada estáticamente (es decir, el tipo de la variable debe definirse antes del tiempo de compilación), debe especificar el tipo de la variable.

Vamos a definir una variable **string** en nuestro contrato:

```
pragma solidity ^0.4.18;

contract Demo {
    
   string fName = 'Miguel';
    
}
```

En Solidity se define una variable especificando primero su tipo.

¿Qué otros tipos hay?

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

Vamos a definir mi edad. Nadie puede tener una edad negativa, por lo que utilizaremos un entero sin signo para esto (**uint**):

```
pragma solidity ^0.4.18;

contract Demo {
    
   string fName = 'Miguel';
   uint age = 18; // :)
    
}
```

## Public and Private
Solidity tiene cuatro tipos de visibilidades para funciones y variables:

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

contract MyContract {
    
   string public fName = 'Miguel';
   uint public age = 18; // :)
    
}
```

## Smart Contract Constructor
Cada contrato inteligente tiene una función de constructor. Se llama a este constructor cuando se crea un contrato. En su interior, puede definir los valores de las variables.

```
pragma solidity ^0.4.18;

contract MyContract {
    
   string public fName;
   uint public age;
   
   function MyContract() public {
       fName = 'Miguel';
       age = 18;
   }
    
}
```

## Constant Variables
Las variables se pueden declarar como constantes. Como su nombre indica, estas son variables con un valor constante que no cambia.


```
pragma solidity ^0.4.18;

contract MyContract {
    
   string constant fName = 'Miguel';
   uint public age;
   
   function MyContract() public {
       fName = 'Miguel';
       age = 18;
   }
    
}
```

## Setting Variables
Nuestro contrato inteligente en este momento es bastante aburrido. Vamos a integrar una posible interacción del usuario donde podamos definir manualmente el nombre y la edad de alguien humano :P 


```
pragma solidity ^0.4.18;

contract MyContract {
    
   string fName;
   uint age;
   
   function setHuman(string _fName, uint _age) public {
       fName = _fName;
       age = _age;
   }
   
   function getHuman() public constant returns (string, uint) {
       return (fName, age);
   }
    
} 
```
