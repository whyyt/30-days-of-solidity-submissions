// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TipJar {
  
 address public creator;
 
 constructor() {
    creator = msg.sender;
 }
  
 modifier onlyCreator () {
    require(msg.sender == creator, "Can only run by admin");
    _;
 }
 
 event Donation(address indexed donor,uint256 amount);
  
 function buyMeCoffe () public payable {
    require(msg.value > 0, "You can't donate 0 eth, Have some dignity");
    
    emit Donation(msg.sender, msg.value);
 }
 
 function withdrawAllMoney () public onlyCreator {
    uint256 amount = address(this).balance;
    require(amount > 0, "No funds to withdraw.");
    (bool success, ) = creator.call{value:amount}("");
    require(success, "Transaction failed");
 }
 
 function getBalance () public view onlyCreator returns (uint256) {
   return address(this).balance;
 }
  
}