cmake_minimum_required(VERSION 3.22...3.31)
project(nvpro-samples)

# This makes it so that nvpro_core2 samples output their executables inside
# the build_all folder
set(NVPRO_CORE2_OUTPUT_DIR ${CMAKE_CURRENT_LIST_DIR})

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
# vk_gaussian_splatting uses its own update process, and might be out-of-sync.
set(BUILD_vk_gaussian_splatting OFF)

# The first time we visit nvpro_core, every library must be enabled so that we
# create targets for everything.
foreach(_LIB nvaftermath nvapp nvgl nvgpu_monitor nvgui nvimageformats nvshaders_host nvslang nvutils nvvk nvvkglsl nvvkgltf)
  option(NVPRO2_ENABLE_${_LIB} "Enable ${_LIB} as a target in nvpro_core2" ON)
endforeach()

# Load project_data.csv to see which samples support nvpro_core2
file(STRINGS project_data.csv _PROJECT_DATA)
# For each line in _PROJECT_DATA...
while(_PROJECT_DATA)
  list(POP_FRONT _PROJECT_DATA _SAMPLE_NAME)
  # Is it *not* v1?
  if(NOT (_SAMPLE_NAME MATCHES ",v1$"))
    # Trim off the second part of the name, if it exists.
    string(REPLACE "," ";" _SAMPLE_NAME ${_SAMPLE_NAME})
    list(GET _SAMPLE_NAME 0 _SAMPLE_NAME)
    # Only build the sample if it exists,
    # and if building the sample hasn't explicitly been turned off
    set(_SAMPLE_DIR samples/${_SAMPLE_NAME})
    if((EXISTS ${CMAKE_CURRENT_LIST_DIR}/${_SAMPLE_DIR}/CMakeLists.txt)
       AND (BUILD_${_SAMPLE_NAME} OR (NOT DEFINED BUILD_${_SAMPLE_NAME})))
      message(STATUS "------------------------------------------------------------")
      message(STATUS "Processing project: ${_SAMPLE_NAME}")
      # set the option to include the project or not
      set("BUILD_${_SAMPLE_NAME}" ON CACHE BOOL "Include the ${SAMPLE_NAME} sample")
      add_subdirectory(${_SAMPLE_DIR})
    endif()
  endif()
endwhile()

if(NOT NVPRO_SAMPLES_NO_V1_SAMPLES)
  # Call ExternalProject_Add to allow building the legacy samples in the same
  # solution, although they'll all appear as a single target.
  include(ExternalProject)
  ExternalProject_Add(legacy
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/legacy
    BUILD_COMMAND ${CMAKE_COMMAND} --build . --parallel 7 --config $<CONFIG>
    INSTALL_COMMAND ${CMAKE_COMMAND} --install . --config $<CONFIG>
    # We set these just to save enough characters to fit under Windows'
    # MAX_PATH limit on our CI systems.
    PREFIX     ${CMAKE_BINARY_DIR}/v1
    BINARY_DIR ${CMAKE_BINARY_DIR}/v1b
    STAMP_DIR  ${CMAKE_BINARY_DIR}/v1s
  )
endif()
