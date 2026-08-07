cmake_minimum_required(VERSION 3.25)

set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING
    "macOS architectures for the Max external")

project(s3g_clap_max VERSION 0.2.1 LANGUAGES CXX)

if(APPLE)
  enable_language(OBJCXX)
endif()

include(FetchContent)
include(CTest)

set(S3G_MAX_SDK_GIT_REPOSITORY
    "https://github.com/Cycling74/max-sdk-base.git" CACHE STRING
    "Max SDK base repository")
set(S3G_MAX_SDK_GIT_TAG
    "69a69252fdd6ac1d06e246d9a04c0a89d9607a17" CACHE STRING
    "Max SDK base git tag or commit")
set(MAX_SDK_BASE_DIR "" CACHE PATH
    "Path to a max-sdk-base checkout")
if(NOT MAX_SDK_BASE_DIR)
  FetchContent_Declare(max_sdk_base
    GIT_REPOSITORY "${S3G_MAX_SDK_GIT_REPOSITORY}"
    GIT_TAG "${S3G_MAX_SDK_GIT_TAG}")
  FetchContent_GetProperties(max_sdk_base)
  if(NOT max_sdk_base_POPULATED)
    FetchContent_Populate(max_sdk_base)
  endif()
  set(MAX_SDK_BASE_DIR "${max_sdk_base_SOURCE_DIR}")
endif()
if(NOT EXISTS "${MAX_SDK_BASE_DIR}/script/max-pretarget.cmake")
  message(FATAL_ERROR
    "MAX_SDK_BASE_DIR must point to a Cycling '74 max-sdk-base checkout")
endif()

set(S3G_CLAP_GIT_REPOSITORY
    "https://github.com/free-audio/clap.git" CACHE STRING
    "CLAP repository")
set(S3G_CLAP_GIT_TAG "1.2.6" CACHE STRING
    "CLAP git tag or commit")
set(S3G_CLAP_INCLUDE_DIR "" CACHE PATH
    "Path containing clap/clap.h")
if(NOT S3G_CLAP_INCLUDE_DIR)
  FetchContent_Declare(clap
    GIT_REPOSITORY "${S3G_CLAP_GIT_REPOSITORY}"
    GIT_TAG "${S3G_CLAP_GIT_TAG}")
  FetchContent_GetProperties(clap)
  if(NOT clap_POPULATED)
    FetchContent_Populate(clap)
  endif()
  set(S3G_CLAP_INCLUDE_DIR "${clap_SOURCE_DIR}/include")
endif()
if(NOT EXISTS "${S3G_CLAP_INCLUDE_DIR}/clap/clap.h")
  message(FATAL_ERROR "S3G_CLAP_INCLUDE_DIR must contain clap/clap.h")
endif()

set(S3G_CLAP_MAX_PACKAGE_DIR "${CMAKE_CURRENT_LIST_DIR}/package" CACHE PATH
    "Max package directory")
set(C74_LIBRARY_OUTPUT_DIRECTORY
    "${S3G_CLAP_MAX_PACKAGE_DIR}/externals" CACHE PATH
    "Max external output directory")
file(MAKE_DIRECTORY "${C74_LIBRARY_OUTPUT_DIRECTORY}")

add_subdirectory(source/externals/s3g_clap_tilde)

if(BUILD_TESTING)
  add_executable(s3g_clap_host_smoke
    tests/s3g_clap_host_smoke.cpp
    host/s3g_clap_engine.cpp
    host/s3g_clap_module.cpp
    host/s3g_clap_plugin_host.cpp)
  if(APPLE)
    set_source_files_properties(tests/s3g_clap_host_smoke.cpp
      PROPERTIES LANGUAGE OBJCXX)
    target_sources(s3g_clap_host_smoke PRIVATE
      source/externals/s3g_clap_tilde/s3g_clap_editor.mm)
  endif()
  target_compile_features(s3g_clap_host_smoke PRIVATE cxx_std_17)
  target_include_directories(s3g_clap_host_smoke PRIVATE
    "${S3G_CLAP_INCLUDE_DIR}"
    host
    source/externals/s3g_clap_tilde)
  if(APPLE)
    target_link_libraries(s3g_clap_host_smoke PRIVATE
      "-framework AppKit" "-framework CoreFoundation")
  elseif(UNIX)
    target_link_libraries(s3g_clap_host_smoke PRIVATE dl)
  endif()

  set(S3G_CLAP_MAX_TEST_PLUGIN "" CACHE PATH
      "Optional CLAP bundle used by the host smoke test")
  if(S3G_CLAP_MAX_TEST_PLUGIN)
    add_test(NAME s3g_clap_host_smoke
      COMMAND s3g_clap_host_smoke "${S3G_CLAP_MAX_TEST_PLUGIN}")
  endif()
endif()
