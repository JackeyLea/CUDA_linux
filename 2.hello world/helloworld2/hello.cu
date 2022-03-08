#include "hello.h"

extern "C"
__global__ void hellofromGPU(void)
{
    printf("GPU:hello sunyi\n");
}

void showhello(void)
{
    hellofromGPU <<<1,10>>>();
    cudaDeviceSynchronize();
}
