pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";
include "../../node_modules/circomlib/circuits/gates.circom";
include "../../node_modules/circomlib-matrix/circuits/matMul.circom"; // hint: you can use more than one templates in circomlib-matrix to help you

template SystemOfEquations(n) { // n is the number of variables in the system of equations
    signal input x[n]; // this is the solution to the system of equations
    signal input A[n][n]; // this is the coefficient matrix
    signal input b[n]; // this are the constants in the system of equations
    signal output out; // 1 for correct solution, 0 for incorrect solution

    // [bonus] insert your code here
    component mulResult = matMul(n,n,1);
    for(var i = 0; i < n; i++) {
        for(var j = 0; j < n; j++) {
            mulResult.a[i][j] <== A[i][j];
        }
    }

    for(var i = 0; i < n; i++) {
        mulResult.b[i][0] <== x[i];
    }

    component isEqualResult[n];
    component multi_and = MultiAND(n);
    var y = 1;
    for(var i = 0; i < n; i++) {
        isEqualResult[i] = IsEqual();
        isEqualResult[i].in[0] <== mulResult.out[i][0];
        isEqualResult[i].in[1] <== b[i];
        multi_and.in[i] <== isEqualResult[i].out;
    }
    out <== multi_and.out;
}

component main {public [A, b]} = SystemOfEquations(3);