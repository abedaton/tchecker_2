# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.30.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.30.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/antoinb/Desktop/Tchecker/tchecker

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/antoinb/Desktop/Tchecker/tchecker/build

# Include any dependencies generated for this target.
include src/CMakeFiles/tck-syntax.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/tck-syntax.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/tck-syntax.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/tck-syntax.dir/flags.make

src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o: src/CMakeFiles/tck-syntax.dir/flags.make
src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o: /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/syntax-check.cc
src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o: src/CMakeFiles/tck-syntax.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o -MF CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o.d -o CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o -c /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/syntax-check.cc

src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.i"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/syntax-check.cc > CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.i

src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.s"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/syntax-check.cc -o CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.s

src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o: src/CMakeFiles/tck-syntax.dir/flags.make
src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o: /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/tck-syntax.cc
src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o: src/CMakeFiles/tck-syntax.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o -MF CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o.d -o CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o -c /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/tck-syntax.cc

src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.i"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/tck-syntax.cc > CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.i

src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.s"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/antoinb/Desktop/Tchecker/tchecker/src/tck-syntax/tck-syntax.cc -o CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.s

# Object files for target tck-syntax
tck__syntax_OBJECTS = \
"CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o" \
"CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o"

# External object files for target tck-syntax
tck__syntax_EXTERNAL_OBJECTS =

src/tck-syntax: src/CMakeFiles/tck-syntax.dir/tck-syntax/syntax-check.cc.o
src/tck-syntax: src/CMakeFiles/tck-syntax.dir/tck-syntax/tck-syntax.cc.o
src/tck-syntax: src/CMakeFiles/tck-syntax.dir/build.make
src/tck-syntax: src/libtchecker.a
src/tck-syntax: /opt/homebrew/lib/libboost_json.a
src/tck-syntax: /opt/homebrew/lib/libboost_container.a
src/tck-syntax: src/CMakeFiles/tck-syntax.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable tck-syntax"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tck-syntax.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/tck-syntax.dir/build: src/tck-syntax
.PHONY : src/CMakeFiles/tck-syntax.dir/build

src/CMakeFiles/tck-syntax.dir/clean:
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src && $(CMAKE_COMMAND) -P CMakeFiles/tck-syntax.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/tck-syntax.dir/clean

src/CMakeFiles/tck-syntax.dir/depend:
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antoinb/Desktop/Tchecker/tchecker /Users/antoinb/Desktop/Tchecker/tchecker/src /Users/antoinb/Desktop/Tchecker/tchecker/build /Users/antoinb/Desktop/Tchecker/tchecker/build/src /Users/antoinb/Desktop/Tchecker/tchecker/build/src/CMakeFiles/tck-syntax.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/CMakeFiles/tck-syntax.dir/depend

