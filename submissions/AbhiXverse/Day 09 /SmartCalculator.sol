// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.18;

contract SimpleCalculator {

    // function to add two numbers 
    function Add(uint256 a, uint256 b) public pure returns(uint256) {
        return a + b;
    }
    
    // function to subtract two numbers 
    function Sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "sub not possible");
        return a - b;
    }

    // Function to multiply two numbers
    function Multi(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // function to divide two numbers
    function Div(uint256 a, uint256 b) public pure returns (uint256) {
        require (b != 0, "Div not possible");
        return a / b;
    }
}
  
  
contract SmartCalculator {

    SimpleCalculator public SimpleCalc;

    // constructor to set the SimpleCalculator contract address
    constructor(address smartCalculatorAddress) {
        SimpleCalc = SimpleCalculator(smartCalculatorAddress);
    } 
    
    // function to get the sum of two numbers
    function getAdd(uint256 x, uint256 y) public view returns (uint256) {
        return SimpleCalc.Add(x, y);
    }

    // function to get the difference of two numbers
    function getDifference(uint256 x, uint256 y) public view returns (uint256) {
        return SimpleCalc.Sub(x, y);
    }

    // function to get the product of two numbers
    function getproduct(uint256 x, uint256 y) public view returns (uint256) {
        return SimpleCalc.Multi(x, y);
    }

    // function to get the  of two numbers
    function getQuotient(uint256 x, uint256 y) public view returns (uint256) {
        return SimpleCalc.Div(x, y);
    }
}
