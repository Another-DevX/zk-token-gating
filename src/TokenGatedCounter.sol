// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./Verifier.sol";

contract TokenGatedCounter {
    HonkVerifier public verifier;

    uint256 public counter;

    event CounterIncremented(uint256 newValue);

    constructor(address _verifier) {
        verifier = HonkVerifier(_verifier);
    }

    function incrementWithProof(
        bytes calldata proof,
        bytes32[] calldata publicInputs
    ) external returns (bool success) {
        bool isValid = verifier.verify(proof, publicInputs);
        if (isValid) {
            counter++;
            emit CounterIncremented(counter);
            return true;
        }
        return false;
    }

    function getCounter() external view returns (uint256) {
        return counter;
    }
}
