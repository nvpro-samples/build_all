#!/bin/bash
# script to clone all existing samples
folder() {
    if [ ! -d "../$1" ]
    then
        pushd ..
	      git clone git@github.com:nvpro-samples/$1.git --recursive
        popd
    else
        echo "../$1 already there... pulling"
        pushd ../$1
        git pull
        git submodule update --init --recursive
        popd
    fi
}

folder build_all
folder shared_sources
folder shared_external
folder gl_cadscene_rendertechniques
folder gl_cuda_interop_pingpong_st
folder gl_cl_interop_pingpong_st
folder gl_commandlist_basic
folder gl_dynamic_lod
folder gl_multicast
folder gl_path_rendering_CMYK
folder gl_occlusion_culling
folder gl_ssao
folder gl_vk_chopper
folder gl_vk_supersampled
folder gl_vk_bk3dthreaded
folder gl_vk_meshlet_cadscene
folder gl_vk_threaded_cadscene
folder gl_vk_raytrace_interop
folder gl_vk_simple_interop
folder vk_raytrace
folder vk_denoise
folder vk_async_resources
folder vk_shaded_gltfscene
floder vk_raytracing_tutorial
exit 0

