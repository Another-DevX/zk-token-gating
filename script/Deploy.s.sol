// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Verifier.sol";
import "../src/TokenGatedCounter.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();

        // Desplegar el verificador
        HonkVerifier verifier = new HonkVerifier();
        console.log("Verificador desplegado en:", address(verifier));

        // Desplegar el contador con la dirección del verificador
        TokenGatedCounter counter = new TokenGatedCounter(address(verifier));
        console.log("Contador desplegado en:", address(counter));

        vm.stopBroadcast();
    }
} 