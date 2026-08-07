set(AUTHOR_DOMAIN "com.s3g")
set(BUNDLE_IDENTIFIER "s3g-clap")
set(GIT_VERSION_TAG "${PROJECT_VERSION}")
set(PACKAGE_VERSION "${PROJECT_VERSION}")
set(COPYRIGHT_STRING "Copyright 2026 Shawn Greenlee")

include("${MAX_SDK_BASE_DIR}/script/max-pretarget.cmake")

set(${PROJECT_NAME}_EXTERN_OUTPUT_NAME "s3g.clap~" CACHE STRING "" FORCE)

add_library(${PROJECT_NAME} MODULE
  s3g_clap_tilde.cpp
  ../../../host/s3g_clap_discovery.cpp
  ../../../host/s3g_clap_engine.cpp
  ../../../host/s3g_clap_module.cpp
  ../../../host/s3g_clap_plugin_host.cpp)

if(APPLE)
  target_sources(${PROJECT_NAME} PRIVATE
    s3g_clap_bundle_picker.mm
    s3g_clap_editor.mm)
endif()

target_include_directories(${PROJECT_NAME} PRIVATE
  ${C74_INCLUDES}
  "${S3G_CLAP_INCLUDE_DIR}"
  ../../../host)

if(APPLE)
  target_link_libraries(${PROJECT_NAME} PRIVATE
    "-framework AppKit" "-framework CoreFoundation")
elseif(UNIX)
  target_link_libraries(${PROJECT_NAME} PRIVATE dl)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
  target_compile_options(${PROJECT_NAME} PRIVATE
    -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion)
endif()
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # Max's method ABI intentionally casts typed object callbacks to `method`,
  # and the SDK's object_method macro currently trips this C++17 diagnostic.
  target_compile_options(${PROJECT_NAME} PRIVATE
    -Wno-cast-function-type-mismatch -Wno-c++20-extensions)
endif()

include("${MAX_SDK_BASE_DIR}/script/max-posttarget.cmake")
