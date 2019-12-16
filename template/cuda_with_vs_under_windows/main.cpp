#include <QCoreApplication>

extern "C"
void runCudaPart();

int main(int argc, char *argv[])
{
    runCudaPart();
}
