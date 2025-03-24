namespace QuantumApp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;

    operation Main() : String {
        // Then we need to transform them as encrypted keys
        let keys = GenerateQuantumKey(256);
        return keys;
    }

    operation GenerateQuantumKey(length : Int) : String {
        use qubits = Qubit[length];
        mutable keyBits = [];

        for q in qubits {
            H(q);
            let result = M(q);
            set keyBits += [ResultAsBool(result)];
			Reset(q);
        }

        mutable bitString = "";
        for bit in keyBits {
            set bitString += BoolToString(bit);
        }

        return bitString;
    }

    function BoolToString(b : Bool) : String {
        return b ? "1" | "0";
    }
}
