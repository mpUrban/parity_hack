# Parity Multisig Wallet Hack Study

This repo was used to experiment with and capture notes on the Parity hack smart contract vulnerability as part of a Udacity course. 

In typical, smart contract programming, the coder has to consider a new set of problems beyond the typical programming language:  security and network resource usage (Ethereum gas).  In many cases, an individual contract does not have a vulnerability.  ***Its interaction with other contracts is where a flaw can be created.***  

On the Parity Multisig Wallet version 1.5+, hackers found a vulnerability causing a loss of $30M Ether ($ETH).  [Here](https://etherscan.io/address/0xb3764761e297d6f121e79c32a65829cd1ddb4d32#internaltx) is the wallet the hacker used to divert funds.  

Parity created a contract to help users efficiently create wallets, since their functionality is often needed-- like a library.  The vulnerability is created from the interaction of the Wallet contract to a Library through a fallback function ***which then provides access to delegate calls for any address.***  


## Delegate calls

Delegate calls allow a function from another contract to be called from inside the current contract -- similar to how libraries work.  

## Fallback functions

Each contract can only have 1 fallback function and they are unnamed.  It's similar to a final ```else``` condition in an if statement used to direct any exceptions.  Perhaps, if there is a spelling error in a function call, the fallback function could catch it.  If a user tries to call a function that isn't in the contract, the fallout will catch it.  

## Putting them together

The wallet sends all unmatched function calls to the library using ```delegatecall```.  All public functions from the library are now callable by anybody.  To prevent the vulerability, the contract could have avoided putting the delegate call in the fallback function to serve as a catch.   The fallback function does not have the modifier to check 

Somebody could call the Wallet contract with the name of a function that only exists in the referenced library.  In this example, the addOwner() function is accessible to the public via the fallbackfunction.  
