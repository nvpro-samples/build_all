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
folder nvpro_core

folder dx12_present_barrier
folder gl_cadscene_rendertechniques
folder gl_commandlist_basic
folder gl_cuda_simple_interop
folder gl_dynamic_lod
folder gl_multicast
folder gl_occlusion_culling
folder gl_path_rendering_CMYK
folder gl_render_vk_direct_display
folder gl_ssao
folder gl_vk_bk3dthreaded
folder gl_vk_chopper
folder gl_vk_meshlet_cadscene
folder gl_vk_raytrace_interop
folder gl_vk_simple_interop
folder gl_vk_supersampled
folder gl_vk_threaded_cadscene
folder nvml_enterprise_gpu_check
folder nvtt_samples
folder vk_async_resources
folder vk_compute_mipmaps
folder vk_denoise
folder vk_device_generated_cmds
folder vk_idbuffer_rasterization
folder vk_inherited_viewport
folder vk_memory_decompression
folder vk_mini_path_tracer
folder vk_mini_samples
folder vk_offline
folder vk_order_independent_transparency
folder vk_raytrace
folder vk_raytrace_displacement
folder vk_raytracing_tutorial_KHR
folder vk_shaded_gltfscene
folder vk_timeline_semaphore
folder vk_toon_shader
folder vk_video_samples

exit 0

