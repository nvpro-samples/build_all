![logo](http://nvidianews.nvidia.com/_ir/219/20157/NV_Designworks_logo_horizontal_greenblack.png)

# nvpro-samples

The `build_all` folder is an optional folder that allows you to synchronize and build all the samples that you have cloned using a single solution.

* CMakeLists.txt: the cmake file that will walk through samples to include them in the project
* README.md: this file
* LICENSE.md: the license used for all nvpro-samples
* batch/script files: allows to easily clone/pull all existing samples

Running `clone_all` batch/script will create following directory structure

```
build_all
shared_sources
shared_external
... (all repositories specified in the script)
```

Each sample can be built either individually, or with `build_all/CMakeLists.txt` as single solution. You can still configure the solution for `build_all` to only include a subset of projects with the appropriate `BUILD_sample_name` checkbox in the cmake-ui.

Building as 64-bit is required and currently we only support the Windows platform (MSVC 2017 is the compiler we use foremost). Linux will come at a later time.

# Shared Dependencies

* [shared_sources](https://github.com/nvpro-samples/shared_sources): The primary framework that all samples depend on. Contains window management, ui, and various api helpers.
* [shared_external](https://github.com/nvpro-samples/shared_external): Third party libraries that are provided pre-compiled, mostly for Windows x64 / MSVC.

# OpenGL/Vulkan Samples

These samples use the `gl_vk_` prefix and showcase Vulkan and OpenGL techniques within
the same application (`gl_vk_sample_name.exe`) or just Vulkan alone (`vk_sample_name.exe`). If available, using the `BUILD_gl_vk_sample_name_VULKAN_ONLY` option, you can omit building the combined executable file. The `VULKAN_ONLY` mode uses Vulkan's WSI system to create the swapchain, the combined executable uses `GL_NV_draw_vulkan_image`.

## [gl_vk_threaded_cadscene](https://github.com/nvpro-samples/gl_vk_meshlet_cadscene)

![screenshot-gl_vk_threaded_cadscene](doc/gl_vk_threaded_cadscene.png)

OpenGL and Vulkan comparison on rendering a CAD scene using various techniques. Stresses
CPU bottlenecks due to the scene having lots of tiny drawcalls. Also touches upon different ways how to provide per-draw data in Vulkan, as well as how to create drawcalls on multiple thrads in both OpenGL and Vulkan.

* Loads `.csf` and `.gltf 2` models
* GL_NV_draw_vulkan_image (not used in `VULKAN_ONLY`)
* GL_NV_command_list
* GL_NV_vertex_buffer_unified_memory
* GL_NV_uniform_buffer_unified_memory
* VK_NVX_device_generated_commands

## [gl_vk_meshlet_cadscene](https://github.com/nvpro-samples/gl_vk_threaded_cadscene)

![screenshot-gl_vk_meshlet_cadscene](doc/gl_vk_meshlet_cadscene.png)

This OpenGL/Vulkan sample illustrates the use of [mesh shaders](https://devblogs.nvidia.com/introduction-turing-mesh-shaders/) for rendering CAD models.

* Loads `.csf` and `.gltf 2` models
* GL_NV_draw_vulkan_image (not used in `VULKAN_ONLY`)
* GL_NV_mesh_shader
* VK_NV_mesh_shader

## [gl_vk_chopper](https://github.com/nvpro-samples/gl_vk_chopper)

![screenshot-gl_vk_chopper](doc/gl_vk_chopper.png)

Renders an articulated scene with animated and textured models.

* GL_NV_draw_vulkan_image

## [gl_vk_bk3dthreaded](https://github.com/nvpro-samples/gl_vk_bk3dthreaded)

![screenshot-gl_vk_bk3dthreaded](doc/gl_vk_bk3dthreaded.jpg)

Vulkan sample rendering 3D with worker-threads

* GL_NV_draw_vulkan_image

## [gl_vk_supersampled](https://github.com/nvpro-samples/gl_vk_supersampled)

![screenshot-gl_vk_supersampled](doc/gl_vk_supersampled.jpg)

Vulkan sample showing a high quality super-sampled rendering

* GL_NV_draw_vulkan_image

# OpenGL Samples

## [gl_cadscene_rendertechniques](https://github.com/nvpro-samples/gl_cadscene_rendertechniques)

![screenshot-gl_cadscene_rendertechniques](doc/gl_cadscene_rendertechniques.jpg)

OpenGL sample on various rendering approaches for typical CAD scenes. Stresses
CPU bottlenecks due to lots of low-complexity drawcalls.

* Loads `.csf` and `.gltf 2` models
* GL_ARB_multi_draw_indirect
* GL_NV_command_list
* GL_NV_vertex_buffer_unified_memory
* GL_NV_uniform_buffer_unified_memory

## [gl_occlusion_culling](https://github.com/nvpro-samples/gl_occlusion_culling)

![screenshot-gl_occlusion_culling](doc/gl_occlusion_culling.png)

Sample for shader-based occlusion culling, which is more scalable on modern GPUs
than traditional occlusion query techniques. Also showcases how to generate
drawcalls on the GPU, so that occlusion culling techniques don't need CPU
readbacks.

* GL_ARB_multi_draw_indirect
* GL_ARB_indirect_parameters
* GL_NV_command_list
* GL_NV_representative_fragment_test

## [gl_ssao](https://github.com/nvpro-samples/gl_ssao)

![screenshot-gl_cadscene_rendertechniques](doc/gl_cadscene_rendertechniques.jpg)

Optimized screen-space ambient occlusion, cache-aware HBAO

* GL_NV_geometry_shader_passthrough

## [gl_dynamic_lod](https://github.com/nvpro-samples/gl_dynamic_lod)

![screenshot-gl_commandlist_basic](doc/gl_commandlist_basic.jpg)

GPU classifies how to render millions of particles. Close/large particles
use tessellation, medium sized particles use an optimized instancing technique and distant
particles are rendered as points. No CPU readbacks needed.

* GL_ARB_compute_shader
* GL_ARB_multi_draw_indirect

## [gl_commandlist_basic](https://github.com/nvpro-samples/gl_commandlist_basic)

![screenshot-gl_commandlist_basic](doc/gl_commandlist_basic.jpg)

Basic sample for NV_command_list

* GL_NV_command_list

## [gl_path_rendering_CMYK](https://github.com/nvpro-samples/gl_path_rendering_CMYK)

![screenshot-gl_path_rendering_cmyk](doc/gl_path_rendering_cmyk.jpg)

Example of how to use path rendering; and how to use it with CMYK (using multi-render target)

* GL_NV_path_rendering

## [gl_multicast](https://github.com/nvpro-samples/gl_multicast)

Basic sample showcasing multicast capabilities, where one GL stream is very
efficiently sent to multiple GPUs. Typical use-case is for example VR-SLI, where
each GPU renders a different eye.

* GL_NV_gpu_multicast

# CUDA/OpenCL/OpenGL Samples

## [gl_cuda_interop_pingpong_st](https://github.com/nvpro-samples/gl_cuda_interop_pingpong_st)

![screenshot-gl_cuda_interop_st](doc/gl_cuda_interop_st.png)

Single-threaded CUDA OpenGL Interop

## [gl_cl_interop_pingpong_st](https://github.com/nvpro-samples/gl_cl_interop_pingpong_st)
Single-threaded OpenCL OpenGL Interop


