pragma solidity ^0.5.0;
 
contract JointSaving {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdawAmount;
    uint public contractBalance;
    
    function withdraw ( uint amount, address payable recipient) public {
        require (recipient == accountOne || recipient == accountTwo, " You don't own this account!");
        require (amount <= contractBalance, "Insufficient Funds");
    
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }
        recipient.transfer(amount);
        lastWithdawAmount = amount;
        contractBalance = address(this).balance;  
        }
    function deposit() public payable {
        contractBalance = address(this).balance;
        }
    function setAccounts(address payable account1 , address payable account2) public {
        accountOne = account1;
        accountTwo = account2;
    }
    function () external payable {}
}
    