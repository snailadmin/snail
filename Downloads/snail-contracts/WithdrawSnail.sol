contract SnailToken {
    function balanceOf(address addr) returns (uint);
    function transferFrom(address from, address to, uint balance) returns (bool);
    uint public totalSupply;
}

contract WithdrawSnail {
    SnailToken constant public mainSnail = Snail(0xbb9bc244d798123fde783fcc1c72d3bb8c189413);
    

    function withdraw(){
        uint balance = mainSnail.balanceOf(msg.sender);

        if (!mainSnail.transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
            throw;
    }
}
