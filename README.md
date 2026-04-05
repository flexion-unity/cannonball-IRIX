Cannonball - OutRun Engine
==========================

CannonBall is an souped up game engine for the OutRun arcade game. The original 68000 and Z80 assembler code has been rewritten in C++. This makes it possible to make improvements suitable for modern platforms, including a higher frame-rate and widescreen support. It requires the original ROMs, as these contain elements including the graphics and audio data. 

* For an overview of CannonBall and its features, please read the [manual](https://github.com/djyt/cannonball/wiki).
* [Reassembler Blog](http://reassembler.blogspot.co.uk/)
* [Twitter](https://twitter.com/djyt)

Please note that I  maintain the Windows build of CannonBall. Whilst I strive to ensure this is a fully cross-platform project that compiles across Linux, Wii, Mac, Pi4 etc. I do not maintain those ports. Port specific issues should be raised with the respective person. 

Thank you! 
Chris White (Project Creator). 


Getting Started
---------------

CannonBall is coded in C++ and makes use of the SDL 2 and Boost libraries. 

CannonBall has been successfully built for Windows, Mac OS X, Linux, Open Pandora and the Raspberry Pi.

CannonBall can use OpenGL, OpenGLES (mobile platforms) or plain SDL2 for rendering. 

I have recently deprecated support for SDL 1, to focus on SDL 2. But feel free to grab an older version from github if you need it. 


Build on IRIX
-------------

This fork is for IRIX 6.5.x.

* Ensure config.xml is in the working directory. _You can specify an alternate location on the command line_
* Edit config.xml to reflect the paths of your roms and res directories. By default, they should be in the working directory.
* Copy the OutRun revision B romset to the roms subdirectory. 

To compile on IRIX:

Install SDL2, SDL2_devel, boost, gcc (SGUG-RSE)

$ mkdir build && cd build
$ cmake ../cmake/

or to use statically linked SDL2:
$ cmake ../cmake/ -DTARGET=irix.static.cmake

$ make 

or if your SGI has 4 CPUs, use the -j parameter:

$ make -j4
