// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.6.0 <0.9.0;

import "./SimpleStorage.sol";

// This is implemented to understand that we can deploy one contract from other contracts present and We From one contract.
// We can store/fetch details from one contract to another.
contract StorageFactory{
    
    SimpleStorage[] public simpleStorageArr;
    function createSimpleStorageContract() public {
        // Deploying Contracts from another contract. When we try to fetch the record from the array, it returns us the address
        // Of the contract . Example: 0x93Ff8fe9BF40051E8763C864B15A0E87f2f96468.
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArr.push(simpleStorage);
    }
    
    // Retrun the contract which we want to interact with and then stores a value in the contract.
    // address Method: This method returns the address of the contract.
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address, ABI.
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArr[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);
    }
    // Get's the address of the contract with which we want to Interact with and then fetches us the Stored number  
    // Present in that contract.
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArr[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}