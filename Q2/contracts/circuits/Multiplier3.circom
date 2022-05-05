pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals
template Multiplier2 () {
    // Declaration of signals.
    signal input a;
    signal input b;
    signal output x;

    // Constraints.
    x <== a * b;
}

template Multiplier3 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal input c;
   signal output d;  

   // Components. 
   component mult1 = Multiplier2();
   component mult2 = Multiplier2();

   // Constraints.
   mult1.a <== a;
   mult1.b <== b;
   mult2.a <== mult1.x;
   mult2.b <== c;

   // rather than multiplying (a, b & c) directly we split them in 2 expressions.
   d <== mult2.x;
}

component main = Multiplier3();