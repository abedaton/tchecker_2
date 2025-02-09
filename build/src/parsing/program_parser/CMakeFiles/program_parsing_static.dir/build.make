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
include src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/compiler_depend.make

# Include the progress variables for this target.
include src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/progress.make

# Include the compile flags for this target's objects.
include src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/flags.make

src/parsing/program_parser/program.tab.cc: /Users/antoinb/Desktop/Tchecker/tchecker/src/parsing/program_parser/program.yy
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "[BISON][program_parser] Building parser with bison 3.8.2"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /opt/homebrew/opt/bison/bin/bison -v --defines=/Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.tab.hh -o /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.tab.cc /Users/antoinb/Desktop/Tchecker/tchecker/src/parsing/program_parser/program.yy

src/parsing/program_parser/program.tab.hh: src/parsing/program_parser/program.tab.cc
	@$(CMAKE_COMMAND) -E touch_nocreate src/parsing/program_parser/program.tab.hh

src/parsing/program_parser/program.lex-fixed.cc: src/parsing/program_parser/program.lex.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating program.lex-fixed.cc"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && sed -e s/register//g /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.lex.cc > program.lex-fixed.cc

src/parsing/program_parser/program.lex.cc: /Users/antoinb/Desktop/Tchecker/tchecker/src/parsing/program_parser/program.ll
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "[FLEX][program_lexer] Building scanner with flex 2.6.4"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /opt/homebrew/opt/flex/bin/flex -Pppyy -o/Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.lex.cc /Users/antoinb/Desktop/Tchecker/tchecker/src/parsing/program_parser/program.ll

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/flags.make
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o: src/parsing/program_parser/program.tab.cc
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o -MF CMakeFiles/program_parsing_static.dir/program.tab.cc.o.d -o CMakeFiles/program_parsing_static.dir/program.tab.cc.o -c /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.tab.cc

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/program_parsing_static.dir/program.tab.cc.i"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.tab.cc > CMakeFiles/program_parsing_static.dir/program.tab.cc.i

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/program_parsing_static.dir/program.tab.cc.s"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.tab.cc -o CMakeFiles/program_parsing_static.dir/program.tab.cc.s

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/flags.make
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o: src/parsing/program_parser/program.lex-fixed.cc
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/antoinb/Desktop/Tchecker/tchecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o -MF CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o.d -o CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o -c /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.lex-fixed.cc

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.i"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.lex-fixed.cc > CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.i

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.s"
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/program.lex-fixed.cc -o CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.s

program_parsing_static: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.tab.cc.o
program_parsing_static: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/program.lex-fixed.cc.o
program_parsing_static: src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/build.make
.PHONY : program_parsing_static

# Rule to build all files generated by this target.
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/build: program_parsing_static
.PHONY : src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/build

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/clean:
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser && $(CMAKE_COMMAND) -P CMakeFiles/program_parsing_static.dir/cmake_clean.cmake
.PHONY : src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/clean

src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend: src/parsing/program_parser/program.lex-fixed.cc
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend: src/parsing/program_parser/program.lex.cc
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend: src/parsing/program_parser/program.tab.cc
src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend: src/parsing/program_parser/program.tab.hh
	cd /Users/antoinb/Desktop/Tchecker/tchecker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antoinb/Desktop/Tchecker/tchecker /Users/antoinb/Desktop/Tchecker/tchecker/src/parsing/program_parser /Users/antoinb/Desktop/Tchecker/tchecker/build /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser /Users/antoinb/Desktop/Tchecker/tchecker/build/src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/parsing/program_parser/CMakeFiles/program_parsing_static.dir/depend

