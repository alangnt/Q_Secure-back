namespace QuantumApp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;

	operation GetQuantumRandomNumber(): Int {

	    let max = 100;
	    Message($"Sampling a random number between 0 and {max}: ");
	    return GenerateRandomNumberInRange(max);
	}

	operation GenerateRandomNumberInRange(max: Int) : Int {
	    mutable bits = [];
	    let nBits = BitSizeI(max);
	    for idxBit in 1..nBits {
	        set bits += [GeneratedRandomBit()];
	    }
	    let sample = ResultArrayAsInt(bits);

	    return sample > max ? GenerateRandomNumberInRange(max) | sample;
	}

	operation GeneratedRandomBit() : Result {

	    use q = Qubit();
	    H(q);
	    let result = M(q);
	    Reset(q);

	    return result;
	}
}
