cmake_minimum_required(VERSION 3.5)
Project(nvpro-samples)

# setting the base directory will also inform sub-cmake files
# that they are included and not the first entry point
SET(BASE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)
SET(HAS_NVPRO_CORE ON)

INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/../nvpro_core/cmake/setup.cmake)

# These samples don't build on Linux as of today
# Use a syntax like  below to turn off a sample:
#  SET(BUILD_gl_cuda_interop_pingpong_st OFF)
if(UNIX)
  SET(BUILD_dx12_present_barrier OFF)
  SET(BUILD_gl_render_vk_direct_display OFF)
  SET(BUILD_gl_render_vk_ddisplay OFF)
endif(UNIX)

macro(_addFolder _PATH)
  FILE (GLOB samples "${_PATH}/*")
  FOREACH( sample ${samples} )
      if( IS_DIRECTORY ${sample} )
        if( EXISTS ${sample}/CMakeLists.txt )
          # extract the name from the path
          string( REGEX REPLACE "^.*/([^/]*)$" "\\1" SAMPLE_NAME ${sample} )
          if( (NOT (${SAMPLE_NAME} MATCHES "^__")) 
          AND (NOT(${SAMPLE_NAME} STREQUAL "build_all")) 
          AND (NOT(${SAMPLE_NAME} STREQUAL "nvpro_core")) 
          AND (NOT(${SAMPLE_NAME} STREQUAL "shared_sources")) # OBSOLETE folder : renamed as nvpro_core. But we still want to avoid it, in case someone left it by mistake
          AND (NOT(${SAMPLE_NAME} STREQUAL "downloaded_resources")) 
          AND (NOT (BUILD_${SAMPLE_NAME} STREQUAL "OFF")))
              # build the option to include the project or not
              set( "BUILD_${SAMPLE_NAME}" TRUE CACHE BOOL "Include the ${SAMPLE_NAME} sample" )
              # add the project
              if( BUILD_${SAMPLE_NAME})
                add_subdirectory( ${_PATH}/${SAMPLE_NAME} ./${SAMPLE_NAME})
              endif()
            endif()
        endif()
      endif()
  ENDFOREACH( sample ${samples} )
endmacro(_addFolder)
##############################
#### projects ###
##############################
_addFolder("..")
_addFolder("../shipped")

add_subdirectory(../nvpro_core ${CMAKE_BINARY_DIR}/nvpro_core)
