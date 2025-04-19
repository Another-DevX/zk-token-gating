const { splitHonkProof } = require("@aztec/bb.js");
const fs = require('fs');
const path = require('path');

/**
 * Lee el archivo de prueba 'proof' desde la ruta de circuitos y lo convierte en bytes.
 * @returns Los bytes de la prueba
 * @throws Error si el archivo no existe o no puede ser leído
 */
function parseProofFromFile() {
  try {
    // Construir la ruta al archivo de prueba (nombre fijo 'proof')
    const proofPath = path.resolve(__dirname, '../circuits/target/proof');
    
    // Leer el contenido del archivo
    const proofData = fs.readFileSync(proofPath);
    
    // Convertir el contenido usando splitHonkProof
    const {proof, publicInputs} = splitHonkProof(proofData, 0);
    
    // Convertir Uint8Array a bytes
    return Buffer.from(proof).toString('hex');
  } catch (error) {
    if (error instanceof Error) {
      throw new Error(`Error al leer o procesar el archivo de prueba: ${error.message}`);
    }
    throw new Error('Error desconocido al procesar el archivo de prueba');
  }
}

// Función principal para ejecutar desde la línea de comandos
if (require.main === module) {
  try {
    const result = parseProofFromFile();
    console.log('Resultado del parseo:', JSON.stringify(result, null, 2));
  } catch (error) {
    if (error instanceof Error) {
      console.error('Error:', error.message);
    } else {
      console.error('Error desconocido');
    }
    process.exit(1);
  }
}

module.exports = { parseProofFromFile };
