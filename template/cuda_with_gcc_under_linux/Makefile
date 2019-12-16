##############################################################
# date:2019-12-16
# author: JackeyLea
# platform:linux
#############################################################
MAKEFILE      = Makefile

EQ            = =

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_GUI_LIB -DQT_CORE_LIB
CFLAGS        = -pipe -g -Wall -W -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -g -Wall -W -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -I. -I/opt/cuda/include -I/opt/cuda/include -isystem /usr/include/qt -isystem /usr/include/qt/QtGui -isystem /usr/include/qt/QtCore -I. -I/usr/lib/qt/mkspecs/linux-g++
QMAKE         = /usr/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = cudaQt1.0.0
DISTDIR = /home/jackey/GitHub/CUDA_linux/template/cuda_with_qt_under_linux/.tmp/cudaQt1.0.0
LINK          = g++
LFLAGS        = 
LIBS          = $(SUBLIBS) -L/opt/cuda//lib64/ -L/opt/cuda/lib64 -lcudart -lcufft /usr/lib/libQt5Gui.so /usr/lib/libQt5Core.so /usr/lib/libGL.so -lpthread   
AR            = ar cqs
RANLIB        = 
SED           = sed
STRIP         = strip

####### Output directory

OBJECTS_DIR   = ./obj

####### Files

SOURCES       = main.cpp 
OBJECTS       = bilinear_cuda.o \
		main.o
DIST          = 
		cudaQt.pro bilinear.h main.cpp
QMAKE_TARGET  = cudaQt
DESTDIR       = 
TARGET        = cudaQt


first: all
####### Build rules

cudaQt:  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: 
cudaQt.pro:
qmake: FORCE
	@$(QMAKE) -o Makefile cudaQt.pro

qmake_all: FORCE


all: Makefile cudaQt

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`/$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: FORCE
	@test -d $(DISTDIR) || mkdir -p $(DISTDIR)
	$(COPY_FILE) --parents $(DIST) $(DISTDIR)/
	$(COPY_FILE) --parents bilinear.cu $(DISTDIR)/
	$(COPY_FILE) --parents /usr/lib/qt/mkspecs/features/data/dummy.cpp $(DISTDIR)/
	$(COPY_FILE) --parents bilinear.h $(DISTDIR)/
	$(COPY_FILE) --parents main.cpp $(DISTDIR)/


clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) .qmake.stash
	-$(DEL_FILE) Makefile


####### Sub-libraries

mocclean: compiler_moc_header_clean compiler_moc_objc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_objc_header_make_all compiler_moc_source_make_all

check: first

benchmark: first

compiler_cuda_d_make_all: bilinear_cuda.o
compiler_cuda_d_clean:
	-$(DEL_FILE) bilinear_cuda.o
bilinear_cuda.o: bilinear.cu \
		bilinear.h \
		/opt/cuda/include/cuda_runtime.h \
		/opt/cuda/include/crt/host_config.h \
		/opt/cuda/include/builtin_types.h \
		/opt/cuda/include/device_types.h \
		/opt/cuda/include/crt/host_defines.h \
		/opt/cuda/include/driver_types.h \
		/opt/cuda/include/vector_types.h \
		/opt/cuda/include/surface_types.h \
		/opt/cuda/include/texture_types.h \
		/opt/cuda/include/library_types.h \
		/opt/cuda/include/channel_descriptor.h \
		/opt/cuda/include/cuda_runtime_api.h \
		/opt/cuda/include/cuda_device_runtime_api.h \
		/opt/cuda/include/driver_functions.h \
		/opt/cuda/include/vector_functions.h \
		/opt/cuda/include/vector_functions.hpp \
		/opt/cuda/include/crt/device_functions.h \
		/opt/cuda/include/crt/device_functions.hpp \
		/opt/cuda/include/device_atomic_functions.h \
		/opt/cuda/include/device_atomic_functions.hpp \
		/opt/cuda/include/crt/device_double_functions.h \
		/opt/cuda/include/crt/device_double_functions.hpp \
		/opt/cuda/include/sm_20_atomic_functions.h \
		/opt/cuda/include/sm_20_atomic_functions.hpp \
		/opt/cuda/include/sm_32_atomic_functions.h \
		/opt/cuda/include/sm_32_atomic_functions.hpp \
		/opt/cuda/include/sm_35_atomic_functions.h \
		/opt/cuda/include/sm_60_atomic_functions.h \
		/opt/cuda/include/sm_60_atomic_functions.hpp \
		/opt/cuda/include/sm_20_intrinsics.h \
		/opt/cuda/include/sm_20_intrinsics.hpp \
		/opt/cuda/include/sm_30_intrinsics.h \
		/opt/cuda/include/sm_30_intrinsics.hpp \
		/opt/cuda/include/sm_32_intrinsics.h \
		/opt/cuda/include/sm_32_intrinsics.hpp \
		/opt/cuda/include/sm_35_intrinsics.h \
		/opt/cuda/include/sm_61_intrinsics.h \
		/opt/cuda/include/sm_61_intrinsics.hpp \
		/opt/cuda/include/crt/sm_70_rt.h \
		/opt/cuda/include/crt/sm_70_rt.hpp \
		/opt/cuda/include/surface_functions.h \
		/opt/cuda/include/cuda_surface_types.h \
		/opt/cuda/include/texture_fetch_functions.h \
		/opt/cuda/include/cuda_texture_types.h \
		/opt/cuda/include/texture_indirect_functions.h \
		/opt/cuda/include/surface_indirect_functions.h \
		/opt/cuda/include/crt/common_functions.h \
		/opt/cuda/include/crt/math_functions.h \
		/opt/cuda/include/crt/func_macro.h \
		/opt/cuda/include/crt/math_functions.hpp \
		/opt/cuda/include/math_constants.h \
		/opt/cuda/include/device_launch_parameters.h
	/opt/cuda//bin/nvcc -D_DEBUG --use_fast_math -I"." -I"/opt/cuda/include" -I"/opt/cuda//include" -lcudart -lcufft --machine 64 -arch=sm_30 -c -o bilinear_cuda.o bilinear.cu

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_moc_predefs_make_all: moc_predefs.h
compiler_moc_predefs_clean:
	-$(DEL_FILE) moc_predefs.h
moc_predefs.h: /usr/lib/qt/mkspecs/features/data/dummy.cpp
	g++ -pipe -g -Wall -W -dM -E -o moc_predefs.h /usr/lib/qt/mkspecs/features/data/dummy.cpp

compiler_moc_header_make_all:
compiler_moc_header_clean:
compiler_moc_objc_header_make_all:
compiler_moc_objc_header_clean:
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_cuda_d_clean compiler_moc_predefs_clean 

####### Compile

main.o: main.cpp bilinear.h \
		/opt/cuda/include/cuda_runtime.h \
		/opt/cuda/include/crt/host_config.h \
		/opt/cuda/include/builtin_types.h \
		/opt/cuda/include/device_types.h \
		/opt/cuda/include/crt/host_defines.h \
		/opt/cuda/include/driver_types.h \
		/opt/cuda/include/vector_types.h \
		/opt/cuda/include/surface_types.h \
		/opt/cuda/include/texture_types.h \
		/opt/cuda/include/library_types.h \
		/opt/cuda/include/channel_descriptor.h \
		/opt/cuda/include/cuda_runtime_api.h \
		/opt/cuda/include/cuda_device_runtime_api.h \
		/opt/cuda/include/driver_functions.h \
		/opt/cuda/include/vector_functions.h \
		/opt/cuda/include/vector_functions.hpp \
		/opt/cuda/include/crt/device_functions.h \
		/opt/cuda/include/crt/device_functions.hpp \
		/opt/cuda/include/device_atomic_functions.h \
		/opt/cuda/include/device_atomic_functions.hpp \
		/opt/cuda/include/crt/device_double_functions.h \
		/opt/cuda/include/crt/device_double_functions.hpp \
		/opt/cuda/include/sm_20_atomic_functions.h \
		/opt/cuda/include/sm_20_atomic_functions.hpp \
		/opt/cuda/include/sm_32_atomic_functions.h \
		/opt/cuda/include/sm_32_atomic_functions.hpp \
		/opt/cuda/include/sm_35_atomic_functions.h \
		/opt/cuda/include/sm_60_atomic_functions.h \
		/opt/cuda/include/sm_60_atomic_functions.hpp \
		/opt/cuda/include/sm_20_intrinsics.h \
		/opt/cuda/include/sm_20_intrinsics.hpp \
		/opt/cuda/include/sm_30_intrinsics.h \
		/opt/cuda/include/sm_30_intrinsics.hpp \
		/opt/cuda/include/sm_32_intrinsics.h \
		/opt/cuda/include/sm_32_intrinsics.hpp \
		/opt/cuda/include/sm_35_intrinsics.h \
		/opt/cuda/include/sm_61_intrinsics.h \
		/opt/cuda/include/sm_61_intrinsics.hpp \
		/opt/cuda/include/crt/sm_70_rt.h \
		/opt/cuda/include/crt/sm_70_rt.hpp \
		/opt/cuda/include/surface_functions.h \
		/opt/cuda/include/cuda_surface_types.h \
		/opt/cuda/include/texture_fetch_functions.h \
		/opt/cuda/include/cuda_texture_types.h \
		/opt/cuda/include/texture_indirect_functions.h \
		/opt/cuda/include/surface_indirect_functions.h \
		/opt/cuda/include/crt/common_functions.h \
		/opt/cuda/include/crt/math_functions.h \
		/opt/cuda/include/crt/func_macro.h \
		/opt/cuda/include/crt/math_functions.hpp \
		/opt/cuda/include/math_constants.h \
		/opt/cuda/include/device_launch_parameters.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

####### Install

install:  FORCE

uninstall:  FORCE

FORCE:

