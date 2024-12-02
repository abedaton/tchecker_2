# Install script for directory: /Users/antoinb/Desktop/Tchecker/tchecker/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/tck-liveness")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-liveness" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-liveness")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-liveness")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-liveness")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/tck-reach")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-reach" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-reach")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-reach")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-reach")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/tck-simulate")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-simulate" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-simulate")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-simulate")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-simulate")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/tck-syntax")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-syntax" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-syntax")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/homebrew/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-syntax")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/tck-syntax")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/libtchecker.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtchecker.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtchecker.a")
    execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtchecker.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/tchecker" TYPE DIRECTORY FILES "/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/html")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/algorithms/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/clockbounds/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/dbm/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/expression/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/fsm/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/graph/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/parsing/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/refzg/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/statement/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/syncprod/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/system/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/ta/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/ts/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/utils/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/variables/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/vm/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/waiting/cmake_install.cmake")
  include("/Users/antoinb/Desktop/Tchecker/tchecker/cmake-build-debug/src/zg/cmake_install.cmake")

endif()

