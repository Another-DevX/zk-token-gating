// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MockVerifier
 * @dev Un mock del verificador que siempre devuelve true para fines de prueba
 */
contract MockVerifier {
    /**
     * @dev Simula la verificación de una prueba ZK, siempre devolviendo true
     * @param proof La prueba ZK (ignorada en este mock)
     * @param publicInputs Las entradas públicas (ignoradas en este mock)
     * @return Siempre devuelve true
     */
    function verify(bytes calldata proof, bytes32[] calldata publicInputs) external pure returns (bool) {
        // En un entorno real, aquí se verificaría la prueba
        // Para este mock, simplemente devolvemos true
        return true;
    }
} 