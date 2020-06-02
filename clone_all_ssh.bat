@echo off
pushd ..

:: do something cool, then log it
CALL :folder build_all
CALL :folder shared_sources
CALL :folder shared_external
CALL :folder gl_cadscene_rendertechniques
CALL :folder gl_commandlist_basic
CALL :folder gl_dynamic_lod
CALL :folder gl_multicast
CALL :folder gl_occlusion_culling
CALL :folder gl_path_rendering_CMYK
CALL :folder gl_ssao
CALL :folder gl_vk_chopper
CALL :folder gl_vk_supersampled
CALL :folder gl_vk_bk3dthreaded
CALL :folder gl_vk_meshlet_cadscene
CALL :folder gl_vk_threaded_cadscene
CALL :folder gl_vk_raytrace_interop
CALL :folder gl_vk_simple_interop
CALL :folder gl_render_vk_direct_display
CALL :folder vk_raytrace
CALL :folder vk_denoise
CALL :folder vk_async_resources
CALL :folder vk_order_independent_transparency
CALL :folder vk_shaded_gltfscene
CALL :folder vk_raytracing_tutorial
CALL :filder vk_device_generated_cmds

:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%

:: a function to write to a log file and write to stdout
:folder
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