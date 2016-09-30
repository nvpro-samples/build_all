@echo off
pushd ..

:: do something cool, then log it
CALL :folder build_all
CALL :folder gl_cadscene_rendertechniques
CALL :folder optix_prime_baking
CALL :folder gl_vk_bk3dthreaded
CALL :folder gl_vk_threaded_cadscene
CALL :folder shared_sources
CALL :folder gl_cadscene_rendertechniques
CALL :folder gl_cl_interop_pingpong_st
CALL :folder shared_external
CALL :folder gl_ssao
CALL :folder gl_vk_supersampled
CALL :folder gl_commandlist_basic
CALL :folder gl_dynamic_lod
CALL :folder gl_occlusion_culling
CALL :folder gl_vk_chopper
CALL :folder gl_cuda_interop_pingpong_st
CALL :folder gl_commandlist_bk3d_models
CALL :folder gl_optix_composite
CALL :folder shared_optix
CALL :folder gl_multicast
CALL :folder gl_simple_FBO

:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%

:: a function to write to a log file and write to stdout
:folder
IF EXIST %* GOTO NOWINDIR
	git clone https://github.com/nvpro-samples/%*.git --recursive
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