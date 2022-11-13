pragma solidity ^0.4.19;

contract Bank {

    mapping(address => uint256) public balanceOf;   // balances, indexed by addresses

    function Deposit()public payable{
        balanceOf[msg.sender] += msg.value;
    }   

    function withdraw(uint256 amount) public payable returns(bool) {
        require(amount <= balanceOf[msg.sender], 'Insufficient funds');
        balanceOf[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return true;
    }

    function showb() public view returns(uint256) {
        return balanceOf[msg.sender];
    }
}