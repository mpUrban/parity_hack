contract Library {
    function initWallet() {
        // code
    }

    function addOwner(address owner) {
        // code
    }

    function isOwner(address _addr) constant returns (bool) {
        // code
    }
}

contract Wallet {
   function isOwner(address _addr) constant returns (bool) {
       return _walletLibrary.delegatecall(msg.data);
   }
    // fallback function
    function() {
        // delegate call
        _walletLibrary.delegatecall(msg.data)
    }

}