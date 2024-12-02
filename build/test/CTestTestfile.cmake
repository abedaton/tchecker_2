# CMake generated Testfile for 
# Source directory: /Users/antoinb/Desktop/Tchecker/tchecker/test
# Build directory: /Users/antoinb/Desktop/Tchecker/tchecker/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(build-tck-reach "/opt/homebrew/Cellar/cmake/3.30.3/bin/cmake" "--build" "/Users/antoinb/Desktop/Tchecker/tchecker/build" "--config" "Debug" "--target" "tck-reach")
set_tests_properties(build-tck-reach PROPERTIES  FIXTURES_SETUP "BUILD_TCK_REACH" _BACKTRACE_TRIPLES "/Users/antoinb/Desktop/Tchecker/tchecker/test/CMakeLists.txt;57;add_test;/Users/antoinb/Desktop/Tchecker/tchecker/test/CMakeLists.txt;0;")
subdirs("testutils")
subdirs("unit-tests")
subdirs("bugfixes")
subdirs("simple-nr")
subdirs("algos")
