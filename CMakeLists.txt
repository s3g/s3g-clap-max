cmake_minimum_required(VERSION 3.25)

if(APPLE)
  set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING
      "macOS architectures for the Max external")
  set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING
      "Minimum macOS version for the universal Max external")
endif()

project(s3g_clap_max VERSION 0.7.0 LANGUAGES CXX)

if(WIN32)
  # Windows headers otherwise define min/max macros that break std::min,
  # std::max, and numeric_limits::max in the native MSVC build.
  add_compile_definitions(NOMINMAX)
endif()

if(APPLE)
  enable_language(OBJCXX)
endif()

include(FetchContent)
include(CTest)

find_package(Python3 QUIET COMPONENTS Interpreter)
if(Python3_Interpreter_FOUND)
  add_custom_target(s3g_m4l_devices ALL
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-devices.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-ambi36.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-extra-effects.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-next-batch.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-field-tools.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-calibration-processors.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-output-tools.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-final-midi-sample.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-tracker.py"
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_LIST_DIR}/scripts/generate-m4l-midi-to-live.py"
    WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
    COMMENT "Generating s3g Max for Live devices")
  if(BUILD_TESTING)
    add_test(NAME s3g_m4l_device_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_devices.py")
    add_test(NAME s3g_m4l_ambi36_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_ambi36_devices.py")
    add_test(NAME s3g_m4l_extra_effects_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_extra_effects.py")
    add_test(NAME s3g_m4l_next_batch_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_next_batch.py")
    add_test(NAME s3g_m4l_field_tools_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_field_tools.py")
    add_test(NAME s3g_m4l_calibration_processors_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_calibration_processors.py")
    add_test(NAME s3g_m4l_output_tools_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_output_tools.py")
    add_test(NAME s3g_m4l_final_midi_sample_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_final_midi_sample.py")
    add_test(NAME s3g_m4l_tracker_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_tracker.py")
    add_test(NAME s3g_m4l_device_type_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_device_types.py")
    add_test(NAME s3g_m4l_midi_to_live_validation
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_m4l_midi_to_live.py")
    add_test(NAME s3g_m4l_windows_release_device_validation
      COMMAND "${Python3_EXECUTABLE}" -B
        "${CMAKE_CURRENT_LIST_DIR}/tests/validate_windows_release_devices.py")
  endif()
endif()

set(S3G_MAX_SDK_GIT_REPOSITORY
    "https://github.com/Cycling74/max-sdk-base.git" CACHE STRING
    "Max SDK base repository")
set(S3G_MAX_SDK_GIT_TAG
    "c03a2922a2a8ff149165a1e2ea134e9321d6e202" CACHE STRING
    "Max SDK base git tag or commit")
set(MAX_SDK_BASE_DIR "" CACHE PATH
    "Path to a max-sdk-base checkout")
if(NOT MAX_SDK_BASE_DIR)
  FetchContent_Declare(max_sdk_base
    GIT_REPOSITORY "${S3G_MAX_SDK_GIT_REPOSITORY}"
    GIT_TAG "${S3G_MAX_SDK_GIT_TAG}"
    SOURCE_SUBDIR _s3g_fetch_only)
  FetchContent_MakeAvailable(max_sdk_base)
  set(MAX_SDK_BASE_DIR "${max_sdk_base_SOURCE_DIR}")
endif()
if(NOT EXISTS "${MAX_SDK_BASE_DIR}/script/max-pretarget.cmake")
  message(FATAL_ERROR
    "MAX_SDK_BASE_DIR must point to a Cycling '74 max-sdk-base checkout")
endif()

set(S3G_CLAP_GIT_REPOSITORY
    "https://github.com/free-audio/clap.git" CACHE STRING
    "CLAP repository")
set(S3G_CLAP_GIT_TAG "1.2.10" CACHE STRING
    "CLAP git tag or commit")
set(S3G_CLAP_INCLUDE_DIR "" CACHE PATH
    "Path containing clap/clap.h")
if(NOT S3G_CLAP_INCLUDE_DIR)
  FetchContent_Declare(clap
    GIT_REPOSITORY "${S3G_CLAP_GIT_REPOSITORY}"
    GIT_TAG "${S3G_CLAP_GIT_TAG}"
    SOURCE_SUBDIR _s3g_fetch_only)
  FetchContent_MakeAvailable(clap)
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
  add_executable(s3g_clap_state_codec_test
    tests/s3g_clap_state_codec_test.cpp)
  target_compile_features(s3g_clap_state_codec_test PRIVATE cxx_std_17)
  target_include_directories(s3g_clap_state_codec_test PRIVATE host)
  add_test(NAME s3g_clap_state_codec_test
    COMMAND s3g_clap_state_codec_test)

  add_executable(s3g_clap_host_smoke
    tests/s3g_clap_host_smoke.cpp
    host/s3g_clap_discovery.cpp
    host/s3g_clap_engine.cpp
    host/s3g_clap_module.cpp
    host/s3g_clap_plugin_host.cpp)
  if(APPLE)
    set_source_files_properties(tests/s3g_clap_host_smoke.cpp
      PROPERTIES LANGUAGE OBJCXX)
    target_sources(s3g_clap_host_smoke PRIVATE
      source/externals/s3g_clap_tilde/s3g_clap_editor.mm)
  elseif(WIN32)
    target_sources(s3g_clap_host_smoke PRIVATE
      source/externals/s3g_clap_tilde/s3g_clap_editor_win.cpp)
  endif()
  target_compile_features(s3g_clap_host_smoke PRIVATE cxx_std_17)
  target_include_directories(s3g_clap_host_smoke PRIVATE
    "${S3G_CLAP_INCLUDE_DIR}"
    host
    source/externals/s3g_clap_tilde)
  if(APPLE)
    target_link_libraries(s3g_clap_host_smoke PRIVATE
      "-framework AppKit" "-framework CoreFoundation")
  elseif(WIN32)
    target_link_libraries(s3g_clap_host_smoke PRIVATE user32)
  elseif(UNIX)
    target_link_libraries(s3g_clap_host_smoke PRIVATE dl)
  endif()

  add_executable(s3g_clap_host_benchmark
    tests/s3g_clap_host_benchmark.cpp
    host/s3g_clap_engine.cpp
    host/s3g_clap_module.cpp
    host/s3g_clap_plugin_host.cpp)
  target_compile_features(s3g_clap_host_benchmark PRIVATE cxx_std_17)
  target_include_directories(s3g_clap_host_benchmark PRIVATE
    "${S3G_CLAP_INCLUDE_DIR}"
    host)
  if(APPLE)
    target_link_libraries(s3g_clap_host_benchmark PRIVATE
      "-framework CoreFoundation")
  elseif(WIN32)
    target_link_libraries(s3g_clap_host_benchmark PRIVATE user32)
  elseif(UNIX)
    target_link_libraries(s3g_clap_host_benchmark PRIVATE dl)
  endif()

  set(S3G_CLAP_MAX_TEST_PLUGIN "" CACHE PATH
      "Optional CLAP bundle used by the host smoke test")
  set(S3G_CLAP_MAX_TEST_NAME "" CACHE STRING
      "Optional human-readable name used by the discovery smoke test")
  if(S3G_CLAP_MAX_TEST_PLUGIN)
    set(S3G_CLAP_MAX_TEST_COMMAND
      s3g_clap_host_smoke "${S3G_CLAP_MAX_TEST_PLUGIN}")
    if(S3G_CLAP_MAX_TEST_NAME)
      list(APPEND S3G_CLAP_MAX_TEST_COMMAND "${S3G_CLAP_MAX_TEST_NAME}")
    endif()
    add_test(NAME s3g_clap_host_smoke COMMAND ${S3G_CLAP_MAX_TEST_COMMAND})
    get_filename_component(S3G_CLAP_MAX_TEST_ROOT
      "${S3G_CLAP_MAX_TEST_PLUGIN}" DIRECTORY)
    set_tests_properties(s3g_clap_host_smoke PROPERTIES
      ENVIRONMENT "CLAP_PATH=${S3G_CLAP_MAX_TEST_ROOT}")
  endif()
endif()
