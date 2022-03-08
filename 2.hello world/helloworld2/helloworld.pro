TEMPLATE = app
DEPENDPATH += .
INCLUDEPATH += . \
    /opt/cuda/include

QT += core gui
CONFIG += debug

LIBS += -L"/opt/cuda/lib64" \
    -lcudart \
    -lcufft

HEADERS += hello.h

SOURCES += main.cpp

OTHER_FILES += hello.cu

CUDA_SOURCES += hello.cu

CUDA_SDK = "/opt/cuda"   # Path to cuda SDK install
CUDA_DIR = "/opt/cuda/"            # Path to cuda toolkit install
SYSTEM_NAME = linux         # Depending on your system either 'Win32', 'x64', or 'Win64'
SYSTEM_TYPE = 64            # '32' or '64', depending on your system
CUDA_ARCH = sm_80           # Type of CUDA architecture, for example 'compute_10', 'compute_11', 'sm_10'
NVCC_OPTIONS = --use_fast_math


INCLUDEPATH += $$CUDA_DIR/include
QMAKE_LIBDIR += $$CUDA_DIR/lib64/

CUDA_OBJECTS_DIR = ./

CUDA_LIBS = cudart cufft
CUDA_INC = $$join(INCLUDEPATH,'" -I"','-I"','"')
NVCC_LIBS = $$join(CUDA_LIBS,' -l','-l', '')

CONFIG(debug, debug|release) {
    # Debug mode
    cuda_d.input = CUDA_SOURCES
    cuda_d.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.o
    cuda_d.commands = $$CUDA_DIR/bin/nvcc -D_DEBUG $$NVCC_OPTIONS $$CUDA_INC $$NVCC_LIBS --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
    cuda_d.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda_d
}
else {
    # Release mode
    cuda.input = CUDA_SOURCES
    cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.o
    cuda.commands = $$CUDA_DIR/bin/nvcc $$NVCC_OPTIONS $$CUDA_INC $$NVCC_LIBS --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH -O3 -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
    cuda.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda
}
