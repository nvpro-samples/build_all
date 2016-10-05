#!/bin/bash
# script to clone all existing samples
folder() {
    if [ ! -d "../$1" ]
    then
        pushd ..
	git clone https://github.com/nvpro-samples/$1.git --recursive
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
folder gl_cadscene_rendertechniques
folder optix_prime_baking
folder gl_vk_bk3dthreaded
folder gl_vk_threaded_cadscene
folder shared_sources
folder gl_cadscene_rendertechniques
folder gl_cl_interop_pingpong_st
folder shared_external
folder gl_ssao
folder gl_vk_supersampled
folder gl_commandlist_basic
folder gl_dynamic_lod
folder gl_occlusion_culling
folder gl_vk_chopper
folder gl_cuda_interop_pingpong_st
folder gl_commandlist_bk3d_models
folder gl_optix_composite
folder shared_optix
folder gl_multicast
folder gl_simple_FBO
exit 0

