TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

win32{
        TARGET = test

        # Define output directories
        DESTDIR = ../bin
        CUDA_OBJECTS_DIR = OBJECTS_DIR/../cuda

        # This makes the .cu files appear in your project
        CUDA_SOURCES += \
            hello.cu

        # MSVCRT link option (static or dynamic, it must be the same with your Qt SDK link option)
        MSVCRT_LINK_FLAG_DEBUG   = "/MDd"
        MSVCRT_LINK_FLAG_RELEASE = "/MD"

        # CUDA settings
        CUDA_DIR = $$quote("C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.5")            # Path to cuda toolkit install
        SYSTEM_NAME = x64                   # Depending on your system either 'Win32', 'x64', or 'Win64'
        SYSTEM_TYPE = 64                    # '32' or '64', depending on your system
        CUDA_ARCH = sm_60                   # Type of CUDA architecture
        NVCC_OPTIONS = --use_fast_math

        # include paths
        INCLUDEPATH += $$CUDA_DIR/include \
                       #$$CUDA_DIR/common/inc \
                       #$$CUDA_DIR/../shared/inc

        # library directories
        QMAKE_LIBDIR += $$CUDA_DIR/lib/$$SYSTEM_NAME \
                        $$CUDA_DIR/common/lib/$$SYSTEM_NAME \
                        $$CUDA_DIR/../shared/lib/$$SYSTEM_NAME

        # The following makes sure all path names (which often include spaces) are put between quotation marks
        CUDA_INC = $$join(INCLUDEPATH,'" -I"','-I"','"')

        # Add the necessary libraries
        CUDA_LIB_NAMES = cudart_static kernel32 user32 gdi32 winspool comdlg32 \
                         advapi32 shell32 ole32 oleaut32 uuid odbc32 odbccp32 \
                         #freeglut glew32

        for(lib, CUDA_LIB_NAMES) {
            CUDA_LIBS += -l$$lib
        }
        LIBS += $$CUDA_LIBS

        # Configuration of the Cuda compiler
        CONFIG(debug, debug|release) {
            # Debug mode
            cuda_d.input = CUDA_SOURCES
            cuda_d.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.obj
            cuda_d.commands = $$CUDA_DIR/bin/nvcc.exe -D_DEBUG $$NVCC_OPTIONS $$CUDA_INC $$LIBS \
                              --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH \
                              --compile -cudart static -g -DWIN32 -D_MBCS \
                              -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/Od,/Zi,/RTC1" \
                              -Xcompiler $$MSVCRT_LINK_FLAG_DEBUG \
                              -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
            cuda_d.dependency_type = TYPE_C
            QMAKE_EXTRA_COMPILERS += cuda_d
        }else {
            # Release mode
            cuda.input = CUDA_SOURCES
            cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.obj
            cuda.commands = $$CUDA_DIR/bin/nvcc.exe $$NVCC_OPTIONS $$CUDA_INC $$LIBS \
                            --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH \
                            --compile -cudart static -DWIN32 -D_MBCS \
                            -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/O2,/Zi" \
                            -Xcompiler $$MSVCRT_LINK_FLAG_RELEASE \
                            -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
            cuda.dependency_type = TYPE_C
            QMAKE_EXTRA_COMPILERS += cuda
        }
}
unix{
TEMPLATE = app

LIBS += -L"/opt/cuda/lib64" \
    -lcudart \
    -lcufft

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
}else {
    # Release mode
    cuda.input = CUDA_SOURCES
    cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.o
    cuda.commands = $$CUDA_DIR/bin/nvcc $$NVCC_OPTIONS $$CUDA_INC $$NVCC_LIBS --machine $$SYSTEM_TYPE -arch=$$CUDA_ARCH -O3 -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME}
    cuda.dependency_type = TYPE_C
    QMAKE_EXTRA_COMPILERS += cuda
}
}
