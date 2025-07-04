cmake_minimum_required(VERSION 3.5...3.31)
Project(nvpro-samples-v1)

# setting the base directory will also inform sub-cmake files
# that they are included and not the first entry point
SET(BASE_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..)
SET(HAS_NVPRO_CORE ON)

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/../nvpro_core/cmake/setup.cmake)

# These samples don't build on Linux as of today
# Use a syntax like  below to turn off a sample:
#  SET(BUILD_gl_cuda_interop_pingpong_st OFF)
if(UNIX)
  SET(BUILD_dx12_present_barrier OFF)
  SET(BUILD_gl_render_vk_direct_display OFF)
  SET(BUILD_gl_render_vk_ddisplay OFF)
  SET(BUILD_vk_ddisplay OFF)
  SET(BUILD_vk_streamline OFF)
  SET(BUILD_xr_multi_gpu OFF)
endif(UNIX)

# vk_video_samples has a manual build process, since it uses FFmpeg
# shared libraries that have to be manually downloaded. For that reason, we turn
# it off by default. To build vk_video_samples, please see
# https://github.com/nvpro-samples/vk_video_samples/blob/main/BUILD.md.
set(BUILD_vk_video_samples OFF)
# vk_minimal_latest uses a totally independent build system, and clashes with
# nvpro_core.
SET(BUILD_vk_minimal_latest OFF)

# Load project_data.csv to see which samples support nvpro_core2
file(STRINGS ${CMAKE_CURRENT_LIST_DIR}/../project_data.csv _PROJECT_DATA)
# For each line in _PROJECT_DATA...
while(_PROJECT_DATA)
  list(POP_FRONT _PROJECT_DATA _LINE)
  # Is it v1?
  if(_LINE MATCHES "^(.*),v1$")
    set(_SAMPLE_NAME ${CMAKE_MATCH_1})
    set(_SAMPLE_DIR ${CMAKE_CURRENT_LIST_DIR}/../samples/${_SAMPLE_NAME})
    # Only build the sample if it exists,
    # and if building the sample hasn't explicitly been turned off
    if((EXISTS ${_SAMPLE_DIR}/CMakeLists.txt)
       AND (BUILD_${_SAMPLE_NAME} OR (NOT DEFINED BUILD_${_SAMPLE_NAME})))
      # set the option to include the project or not
      set(BUILD_${_SAMPLE_NAME} ON CACHE BOOL "Include the ${SAMPLE_NAME} sample")
      add_subdirectory(${_SAMPLE_DIR} ${_SAMPLE_NAME})
    endif()
  endif()
endwhile()

add_subdirectory(../nvpro_core nvpro_core)
