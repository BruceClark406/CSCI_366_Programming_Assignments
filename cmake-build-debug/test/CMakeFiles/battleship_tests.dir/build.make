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
CMAKE_SOURCE_DIR = /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug

# Include any dependencies generated for this target.
include test/CMakeFiles/battleship_tests.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/battleship_tests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/battleship_tests.dir/flags.make

test/CMakeFiles/battleship_tests.dir/tests.cpp.o: test/CMakeFiles/battleship_tests.dir/flags.make
test/CMakeFiles/battleship_tests.dir/tests.cpp.o: ../test/tests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/battleship_tests.dir/tests.cpp.o"
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/battleship_tests.dir/tests.cpp.o -c /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/test/tests.cpp

test/CMakeFiles/battleship_tests.dir/tests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/battleship_tests.dir/tests.cpp.i"
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/test/tests.cpp > CMakeFiles/battleship_tests.dir/tests.cpp.i

test/CMakeFiles/battleship_tests.dir/tests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/battleship_tests.dir/tests.cpp.s"
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/test/tests.cpp -o CMakeFiles/battleship_tests.dir/tests.cpp.s

test/CMakeFiles/battleship_tests.dir/tests.cpp.o.requires:

.PHONY : test/CMakeFiles/battleship_tests.dir/tests.cpp.o.requires

test/CMakeFiles/battleship_tests.dir/tests.cpp.o.provides: test/CMakeFiles/battleship_tests.dir/tests.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/battleship_tests.dir/build.make test/CMakeFiles/battleship_tests.dir/tests.cpp.o.provides.build
.PHONY : test/CMakeFiles/battleship_tests.dir/tests.cpp.o.provides

test/CMakeFiles/battleship_tests.dir/tests.cpp.o.provides.build: test/CMakeFiles/battleship_tests.dir/tests.cpp.o


# Object files for target battleship_tests
battleship_tests_OBJECTS = \
"CMakeFiles/battleship_tests.dir/tests.cpp.o"

# External object files for target battleship_tests
battleship_tests_EXTERNAL_OBJECTS =

test/battleship_tests: test/CMakeFiles/battleship_tests.dir/tests.cpp.o
test/battleship_tests: test/CMakeFiles/battleship_tests.dir/build.make
test/battleship_tests: src/libSERVER.a
test/battleship_tests: src/libCLIENT.a
test/battleship_tests: lib/libgtestd.a
test/battleship_tests: lib/libgmock_maind.a
test/battleship_tests: lib/libgmockd.a
test/battleship_tests: lib/libgtestd.a
test/battleship_tests: test/CMakeFiles/battleship_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable battleship_tests"
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/battleship_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/battleship_tests.dir/build: test/battleship_tests

.PHONY : test/CMakeFiles/battleship_tests.dir/build

test/CMakeFiles/battleship_tests.dir/requires: test/CMakeFiles/battleship_tests.dir/tests.cpp.o.requires

.PHONY : test/CMakeFiles/battleship_tests.dir/requires

test/CMakeFiles/battleship_tests.dir/clean:
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test && $(CMAKE_COMMAND) -P CMakeFiles/battleship_tests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/battleship_tests.dir/clean

test/CMakeFiles/battleship_tests.dir/depend:
	cd /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/test /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test /mnt/c/Users/bruce/OneDrive/Documents/GitHub/CSCI_366_Program1/CSCI_366_Programming_Assignments/cmake-build-debug/test/CMakeFiles/battleship_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/battleship_tests.dir/depend

