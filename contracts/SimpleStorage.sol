// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 public favoriteNumber; // Stores the user's favorite number

    uint256[] public favoriteNumbers; // Dynamic array to store multiple favorite numbers

    // Struct to store a person’s name and their favorite number
    struct Person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    Person[] public people; // Array of Person structs to store multiple people's data

    // Enum to manage contract states (Active or Inactive)
    enum ContractState {
        Active, // State representing an active contract
        Inactive // State representing an inactive contract
    }

    ContractState public state; // State variable to store the current contract state

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() private view returns (uint256) {
        uint256 sum = 0; // declaring a local variable
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        } // implementing a loop function
        return sum;
    } 

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function"; }

    // Wrapper function to expose internalFunction for testing purposes
   

    function externalFunction() external pure returns (string memory) {
        return "This is an external function";  // External: Can only be called from outside the contract
    }

    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction();  // Calls the external function within the contract using 'this'
    }

    function addFavoriteNumber(uint256 _value) public {
    favoriteNumbers.push(_value);}

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
    people.push(Person(_name, _favoriteNumber));
    }

    function activateContract() public {
    state = ContractState.Active;
    }

    function deactivateContract() public {
    state = ContractState.Inactive;
    }

    function isActive() public view returns (bool) {
    return state == ContractState.Active;
    }
}
