# build_all folder

build_all folder is an optional folder that allows you to build all the samples that you have cloned

* CMakeLists.txt: the cmake file that will walk through samples to include them in the project
* README.md: this file

# List of available samples
When build_all folder is used for cmake and if you downloaded all the available repositories, you should see the following samples in the IDE of your choice:

## gl cadscene render techniques

![sample screenshot](https://github.com/nvpro-samples/gl_cadscene_rendertechniques/blob/master/doc/sample.jpg)

[github repository](https://github.com/nvpro-samples/gl_cadscene_rendertechniques)

This sample implements several scene rendering techniques, that target mostly static data such as often found in CAD or DCC applications. In this context static means that the vertex and index buffers for the scene's objects hardly change. It is still fine to edit the geometry of a few objects of the scene, but foremost the matrix and material values would be modified across frames. Imagine making edits to the wheel topology of a car, or positioning an engine, that means the rest of the assembly is not modified.
The principle OpenGL mechanisms hat are used here are described in the presentation slides of [SIGGRAPH 2014](http://on-demand.gputechconf.com/siggraph/2014/presentation/SG4117-OpenGL-Scene-Rendering-Techniques.pdf). It is highly recommended to go through the slides first.

The sample makes use of multiple OpenGL 4 core features, such as **ARB_multi_draw_indirect**, but also showcases OpenGL 3 style rendering techniques.

There is also several techniques built around the **NV_command_list** extension. Please refer to [gl commandlist basic](https://github.com/nvpro-samples/gl_commandlist_basic) for an introduction on NV_command_list.

> Note: This is just a sample to illustrates several techniques and possibilities how to approach rendering, its purpose is not to provide production level, highly optimized implementations.

# gl commandlist basic

![sample screenshot](https://github.com/nvpro-samples/gl_commandlist_basic/blob/master/doc/sample.jpg)

[github repository](https://github.com/nvpro-samples/gl_commandlist_basic)

In this sample the **NV_command_list** extension is used to render a basic scene (variant of gl_simple_pipeline sample) and texturing is performed via **ARB_bindless_texture**.

# NVIDIA commandlist extension over bk3d models

![Example](https://github.com/nvpro-samples/gl_commandlist_bk3d_models/blob/master/doc/sample.jpg)

[github repository](https://github.com/nvpro-samples/gl_commandlist_bk3d_models)

This sample shows how to use NVIDIA **command-list** extension over basic CAD scenes, using a pre-baked binary format (bk3d) for various models coming from CAD applications.

This sample shows how to use command-buffers 64 bits addresses as a way to put many of them in a single API call (using glDrawCommandsStatesAddressNV).

This samples shows also a nice way to combine MSAA with super-sampling for very clean rendering (see NVFBOBox).

# gl dynamic lod

![sample screenshot](https://github.com/nvpro-samples/gl_dynamic_lod/blob/master/doc/wireframe.jpg)

[github repository](https://github.com/nvpro-samples/gl_dynamic_lod)

With the addition of indirect rendering (```ARB_draw_indirect``` and ```ARB_multi_draw_indirect```) OpenGL got an efficient mechanism that allows the GPU to create or modify its own work without stalling the pipeline. As CPU and GPU are best used when working asynchronously, avoiding readbacks to CPU to drive decision making is beneficial.

In this sample we use ```ARB_draw_indirect``` and ```ARB_shader_atomic_counters``` to build three distinct render lists for drawing particles as spheres, each using a different shader and representing a different level of detail (LOD): Draw as point; Draw as instanced low resolution mesh; Draw as instanced adaptive tessellated mesh

# gl occlusion culling

![raster](https://github.com/nvpro-samples/gl_occlusion_culling/blob/master/doc/raster.png)

[github repository](https://github.com/nvpro-samples/gl_occlusion_culling)

This sample implements a batched occlusion culling system, which is not based on individual occlusion queries anymore, but uses shaders to cull many boxes at once. The principle algorithms are also illustrated towards the end of the presentation slides of [GTC 2014](http://on-demand.gputechconf.com/gtc/2014/presentations/S4379-opengl-44-scene-rendering-techniques.pdf) and [SIGGRAPH 2014](http://on-demand.gputechconf.com/siggraph/2014/presentation/SG4117-OpenGL-Scene-Rendering-Techniques.pdf)

It leverages the **ARB_multi_draw_indirect** (MDI) extension to implement latency-free occlusion culling. The MDI technique works well with a simplified scene setup where all geometry is stored in one big VBO/IBO pairing and no shader changes are done in between.

The slides mention that this approach could be extended to use NV_bindless_multi_draw_indirect to render drawcalls using different VBO/IBOs in one go. With the upcoming **NV_command_list** however an even better approach is possible, which is also implemented in the sample and allows more flexible state changes. Please refer to [gl commandlist basic](https://github.com/nvpro-samples/gl_commandlist_basic) for an introduction on NV_command_list.

# gl_optix_composite

![sample screenshot](https://github.com/nvpro-samples/gl_optix_composite/blob/master/docs/optix_shadow8.png)

[github repository](https://github.com/nvpro-samples/gl_optix_composite)

The OpenGL + OptiX Compositing sample demonstrates how to mix interactive OpenGL rendering with OptiX overlay compositing. This particular example demonstrates 8x sub-sampled, raytraced hard shadows which are composited with an OpenGL wireframe model. The shadows are computed by OptiX, and the results are placed into an OpenGL texture which represents a screen-space shadow mask. During the final OpenGL rendering past, the shadow mask texture is evaluated to give the fractional shadow factor.

While this sample demonstrates hard shadow compositing, the technique is not limited to shadows, and may be used for reflections, refractions, and other effects generated by GPU OptiX raytracing.

# gl_path_rendering_CMYK

![Example](https://github.com/nvpro-samples/gl_path_rendering_CMYK/blob/master/doc/sample.JPG)

[github repository](https://github.com/nvpro-samples/gl_path_rendering_CMYK)

This sample shows how to use NVIDIA path rendering extension.

It also exposes it through FBO (Frame-buffer-objects) and shows how to work on CMYK-Alpha format.

# gl_simple_FBO

![Example](https://github.com/nvpro-samples/gl_simple_FBO/raw/master/example/example.png)

[github repository](https://github.com/nvpro-samples/gl_simple_FBO)

This sample shows a very simple implementation of OpenGL Frame-buffer object (FBO)

# gl ssao

![sample screenshot](https://github.com/nvpro-samples/gl_ssao/blob/master/doc/sample.jpg)

[github repository](https://github.com/nvpro-samples/gl_ssao)

This sample implements screen space ambient occlusion (SSAO) using horizon-based ambient occlusion (HBAO). You can find some details about HBAO [here](http://www.nvidia.com/object/siggraph-2008-HBAO.html). It provides two alternative implementations the original hbao as well as an enhanced version that is more efficient in improved leveraging of the hardware's texture sampling cache, using [de-interleaved texturing](https://developer.nvidia.com/sites/default/files/akamai/gameworks/samples/DeinterleavedTexturing.pdf).


````
    Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
     * Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
     * Neither the name of NVIDIA CORPORATION nor the names of its
       contributors may be used to endorse or promote products derived
       from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
    OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

````

