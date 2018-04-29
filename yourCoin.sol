pragma solidity ^0.4.21;

contract yourCoin{

    address minter;

    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    function yourCoin() public{

        minter = msg.sender;

    }

    function mint(address receiver, uint amount) public {

        if(msg.sender != minter) return;
        balances[receiver]+=amount;

    }

    function send(address receiver, uint amount) public {
        if(balances[msg.sender] < amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender, receiver, amount);

    }


}
//deployed on kovan testnet: https://kovan.etherscan.io/tx/0xc934bb0b1a46e53494c38bc5b1fce86e48b341b1f0e42eea12b7ee386fbd2977
