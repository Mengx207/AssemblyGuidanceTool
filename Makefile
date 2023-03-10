# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lingbo/Documents/GitHub/AssemblyGuidanceTool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lingbo/Documents/GitHub/AssemblyGuidanceTool

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named planes_intersection

# Build rule for target.
planes_intersection: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 planes_intersection
.PHONY : planes_intersection

# fast build rule for target.
planes_intersection/fast:
	$(MAKE) -f CMakeFiles/planes_intersection.dir/build.make CMakeFiles/planes_intersection.dir/build
.PHONY : planes_intersection/fast

#=============================================================================
# Target rules for targets named laser_dot

# Build rule for target.
laser_dot: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 laser_dot
.PHONY : laser_dot

# fast build rule for target.
laser_dot/fast:
	$(MAKE) -f CMakeFiles/laser_dot.dir/build.make CMakeFiles/laser_dot.dir/build
.PHONY : laser_dot/fast

#=============================================================================
# Target rules for targets named get_rvec_tvec

# Build rule for target.
get_rvec_tvec: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 get_rvec_tvec
.PHONY : get_rvec_tvec

# fast build rule for target.
get_rvec_tvec/fast:
	$(MAKE) -f CMakeFiles/get_rvec_tvec.dir/build.make CMakeFiles/get_rvec_tvec.dir/build
.PHONY : get_rvec_tvec/fast

get_rvec_tvec.o: get_rvec_tvec.cpp.o

.PHONY : get_rvec_tvec.o

# target to build an object file
get_rvec_tvec.cpp.o:
	$(MAKE) -f CMakeFiles/get_rvec_tvec.dir/build.make CMakeFiles/get_rvec_tvec.dir/get_rvec_tvec.cpp.o
.PHONY : get_rvec_tvec.cpp.o

get_rvec_tvec.i: get_rvec_tvec.cpp.i

.PHONY : get_rvec_tvec.i

# target to preprocess a source file
get_rvec_tvec.cpp.i:
	$(MAKE) -f CMakeFiles/get_rvec_tvec.dir/build.make CMakeFiles/get_rvec_tvec.dir/get_rvec_tvec.cpp.i
.PHONY : get_rvec_tvec.cpp.i

get_rvec_tvec.s: get_rvec_tvec.cpp.s

.PHONY : get_rvec_tvec.s

# target to generate assembly for a file
get_rvec_tvec.cpp.s:
	$(MAKE) -f CMakeFiles/get_rvec_tvec.dir/build.make CMakeFiles/get_rvec_tvec.dir/get_rvec_tvec.cpp.s
.PHONY : get_rvec_tvec.cpp.s

laser_dot.o: laser_dot.cpp.o

.PHONY : laser_dot.o

# target to build an object file
laser_dot.cpp.o:
	$(MAKE) -f CMakeFiles/laser_dot.dir/build.make CMakeFiles/laser_dot.dir/laser_dot.cpp.o
.PHONY : laser_dot.cpp.o

laser_dot.i: laser_dot.cpp.i

.PHONY : laser_dot.i

# target to preprocess a source file
laser_dot.cpp.i:
	$(MAKE) -f CMakeFiles/laser_dot.dir/build.make CMakeFiles/laser_dot.dir/laser_dot.cpp.i
.PHONY : laser_dot.cpp.i

laser_dot.s: laser_dot.cpp.s

.PHONY : laser_dot.s

# target to generate assembly for a file
laser_dot.cpp.s:
	$(MAKE) -f CMakeFiles/laser_dot.dir/build.make CMakeFiles/laser_dot.dir/laser_dot.cpp.s
.PHONY : laser_dot.cpp.s

planes_intersection.o: planes_intersection.cpp.o

.PHONY : planes_intersection.o

# target to build an object file
planes_intersection.cpp.o:
	$(MAKE) -f CMakeFiles/planes_intersection.dir/build.make CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o
.PHONY : planes_intersection.cpp.o

planes_intersection.i: planes_intersection.cpp.i

.PHONY : planes_intersection.i

# target to preprocess a source file
planes_intersection.cpp.i:
	$(MAKE) -f CMakeFiles/planes_intersection.dir/build.make CMakeFiles/planes_intersection.dir/planes_intersection.cpp.i
.PHONY : planes_intersection.cpp.i

planes_intersection.s: planes_intersection.cpp.s

.PHONY : planes_intersection.s

# target to generate assembly for a file
planes_intersection.cpp.s:
	$(MAKE) -f CMakeFiles/planes_intersection.dir/build.make CMakeFiles/planes_intersection.dir/planes_intersection.cpp.s
.PHONY : planes_intersection.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... planes_intersection"
	@echo "... laser_dot"
	@echo "... edit_cache"
	@echo "... get_rvec_tvec"
	@echo "... get_rvec_tvec.o"
	@echo "... get_rvec_tvec.i"
	@echo "... get_rvec_tvec.s"
	@echo "... laser_dot.o"
	@echo "... laser_dot.i"
	@echo "... laser_dot.s"
	@echo "... planes_intersection.o"
	@echo "... planes_intersection.i"
	@echo "... planes_intersection.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

