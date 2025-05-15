@echo off
pushd ..

CALL :folder nvpro_core

CALL :folder dx12_present_barrier
CALL :folder gl_cadscene_rendertechniques
CALL :folder gl_commandlist_basic
CALL :folder gl_cuda_simple_interop
CALL :folder gl_dynamic_lod
CALL :folder gl_multi_view_rendering
CALL :folder gl_multicast
CALL :folder gl_occlusion_culling
CALL :folder gl_path_rendering_CMYK
CALL :folder gl_render_vk_ddisplay
CALL :folder gl_ssao
CALL :folder gl_vk_meshlet_cadscene
CALL :folder gl_vk_raytrace_interop
CALL :folder gl_vk_simple_interop
CALL :folder gl_vrs
CALL :folder glsl_indexed_types_generator
CALL :folder nv_cluster_builder
CALL :folder nv_cluster_lod_builder
CALL :folder nvml_enterprise_gpu_check
CALL :folder nvtt_samples
CALL :folder optix_advanced_samples
CALL :folder shared_external
CALL :folder third_party_binaries
CALL :folder vk_animated_clusters
CALL :folder vk_async_resources
CALL :folder vk_compute_mipmaps
CALL :folder vk_ddisplay
CALL :folder vk_denoise_nrd
CALL :folder vk_device_generated_cmds
CALL :folder vk_gaussian_splatting
CALL :folder vk_gltf_renderer
CALL :folder vk_idbuffer_rasterization
CALL :folder vk_inherited_viewport
CALL :folder vk_lod_clusters
CALL :folder vk_memory_decompression
CALL :folder vk_mini_path_tracer
CALL :folder vk_mini_samples
CALL :folder vk_minimal_latest
CALL :folder vk_offline
CALL :folder vk_optix_denoise
CALL :folder vk_order_independent_transparency
CALL :folder vk_partitioned_tlas
CALL :folder vk_raytracing_tutorial_KHR
CALL :folder vk_streamline
CALL :folder vk_tessellated_clusters
CALL :folder vk_timeline_semaphore
CALL :folder vk_toon_shader
CALL :folder vk_video_samples
CALL :folder xr_multi_gpu

:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%

:: a function to write to a log file and write to stdout
:folder
echo "--------------------------------------------"
IF EXIST %* GOTO NOWINDIR
	git clone git@github.com:nvpro-samples/%*.git --recursive
	GOTO DONE
:NOWINDIR
	echo %* already there... pulling
	pushd %*
	git pull
	git submodule update --init --recursive
	popd
EXIT /B 0
:DONE
EXIT /B 0
