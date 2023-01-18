// Kernel definition
#include "cmath"
#include <iostream>
#define N 10

void VecAdd(float *A, float *B, float *C) {
    for (size_t i = 0; i < N; i++) {
        C[i] = A[i] + B[i];
        std::cout << C[i] << " = " << A[i] << "+" << B[i] << std::endl;
    }
}

int main() {
    float *A = new float[N];
    float *B = new float[N];
    float *C = new float[N];

    for (size_t i = 0; i < N; i++) {
        A[i] = 1.0f;
        B[i] = 2.0f;
    }

    float maxError = 0.0f;

    VecAdd(A, B, C);

    for (size_t i = 0; i < N; i++) {
        float error = 3.0f - C[i];
        maxError = fmax(maxError, error);
    }

    std::cout << "Max Error is " << maxError << std::endl;

    // Kernel invocation with N threads

    delete[] A, B, C;
}