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
include CMakeFiles/planes_intersection.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/planes_intersection.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/planes_intersection.dir/flags.make

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o: CMakeFiles/planes_intersection.dir/flags.make
CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o: planes_intersection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o -c /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/planes_intersection.cpp

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/planes_intersection.dir/planes_intersection.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/planes_intersection.cpp > CMakeFiles/planes_intersection.dir/planes_intersection.cpp.i

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/planes_intersection.dir/planes_intersection.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/planes_intersection.cpp -o CMakeFiles/planes_intersection.dir/planes_intersection.cpp.s

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.requires:

.PHONY : CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.requires

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.provides: CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.requires
	$(MAKE) -f CMakeFiles/planes_intersection.dir/build.make CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.provides.build
.PHONY : CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.provides

CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.provides.build: CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o


# Object files for target planes_intersection
planes_intersection_OBJECTS = \
"CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o"

# External object files for target planes_intersection
planes_intersection_EXTERNAL_OBJECTS =

planes_intersection: CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o
planes_intersection: CMakeFiles/planes_intersection.dir/build.make
planes_intersection: /usr/local/lib/libopencv_gapi.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_highgui.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_ml.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_objdetect.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_photo.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_stitching.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_video.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_videoio.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_imgcodecs.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_dnn.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_calib3d.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_features2d.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_flann.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_imgproc.so.4.7.0
planes_intersection: /usr/local/lib/libopencv_core.so.4.7.0
planes_intersection: CMakeFiles/planes_intersection.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable planes_intersection"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/planes_intersection.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/planes_intersection.dir/build: planes_intersection

.PHONY : CMakeFiles/planes_intersection.dir/build

CMakeFiles/planes_intersection.dir/requires: CMakeFiles/planes_intersection.dir/planes_intersection.cpp.o.requires

.PHONY : CMakeFiles/planes_intersection.dir/requires

CMakeFiles/planes_intersection.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/planes_intersection.dir/cmake_clean.cmake
.PHONY : CMakeFiles/planes_intersection.dir/clean

CMakeFiles/planes_intersection.dir/depend:
	cd /home/lingbo/Documents/GitHub/AssemblyGuidanceTool && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool /home/lingbo/Documents/GitHub/AssemblyGuidanceTool/CMakeFiles/planes_intersection.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/planes_intersection.dir/depend
