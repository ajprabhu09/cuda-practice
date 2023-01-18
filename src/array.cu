
// Kernel definition
#include "cmath"
#include <iostream>
#define N 10

__global__ void add(size_t n, float *x, float *y) {
    int index = threadIdx.x;
    int stride = blockDim.x;
    for (size_t i = index; i < n; i+=stride)
    {
        y[i] += x[i];
    }
    
}

int main() {
    float *A, *B;

    float maxError = 0.0f;

    cudaMallocManaged(&A, N * sizeof(float));
    cudaMallocManaged(&B, N * sizeof(float));
    for (size_t i = 0; i < N; i++) {
        A[i] = 1.0f;
        B[i] = 2.0f;
    }

    add<<<1, 1>>>(N, A, B);

    cudaDeviceSynchronize();

    for (size_t i = 0; i < N; i++) {
        float error = 3.0f - B[i];
        maxError = fmax(maxError, error);
    }

    std::cout << "Max Error is " << maxError << std::endl;

    // Kernel invocation with N threads

    cudaFree(A);
    cudaFree(B);
}