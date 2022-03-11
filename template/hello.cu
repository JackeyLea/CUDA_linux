#include <stdio.h>

__global__ void hello_world_kernel(){
    printf("Hello World");
}

int main(){
    hello_world_kernel<<<1,1>>>();
    cudaDeviceSynchronize();
}
