# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# Include any dependencies generated for this target.
include CMakeFiles/LaserDotMeasure_Origin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LaserDotMeasure_Origin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LaserDotMeasure_Origin.dir/flags.make

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o: CMakeFiles/LaserDotMeasure_Origin.dir/flags.make
CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o: LaserDotMeasure_Origin.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o -c /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/LaserDotMeasure_Origin.cpp

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/LaserDotMeasure_Origin.cpp > CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.i

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/LaserDotMeasure_Origin.cpp -o CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.s

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.requires:

.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.requires

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.provides: CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.requires
	$(MAKE) -f CMakeFiles/LaserDotMeasure_Origin.dir/build.make CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.provides.build
.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.provides

CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.provides.build: CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o


# Object files for target LaserDotMeasure_Origin
LaserDotMeasure_Origin_OBJECTS = \
"CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o"

# External object files for target LaserDotMeasure_Origin
LaserDotMeasure_Origin_EXTERNAL_OBJECTS =

LaserDotMeasure_Origin: CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o
LaserDotMeasure_Origin: CMakeFiles/LaserDotMeasure_Origin.dir/build.make
LaserDotMeasure_Origin: /usr/local/lib/libopencv_gapi.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_highgui.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_ml.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_objdetect.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_photo.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_stitching.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_video.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_videoio.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_imgcodecs.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_dnn.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_calib3d.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_features2d.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_flann.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_imgproc.so.4.7.0
LaserDotMeasure_Origin: /usr/local/lib/libopencv_core.so.4.7.0
LaserDotMeasure_Origin: CMakeFiles/LaserDotMeasure_Origin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable LaserDotMeasure_Origin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LaserDotMeasure_Origin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LaserDotMeasure_Origin.dir/build: LaserDotMeasure_Origin

.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/build

CMakeFiles/LaserDotMeasure_Origin.dir/requires: CMakeFiles/LaserDotMeasure_Origin.dir/LaserDotMeasure_Origin.cpp.o.requires

.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/requires

CMakeFiles/LaserDotMeasure_Origin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LaserDotMeasure_Origin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/clean

CMakeFiles/LaserDotMeasure_Origin.dir/depend:
	cd /home/lingbo/Documents/GitHub/AssemblyGuidanceTool && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles/LaserDotMeasure_Origin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LaserDotMeasure_Origin.dir/depend
