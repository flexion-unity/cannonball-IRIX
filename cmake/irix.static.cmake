# -----------------------------------------------------------------------------
# CannonBall IRIX Setup (SGUG-RSE gcc 9.2.0, SDL2)
# -----------------------------------------------------------------------------
#   cmake .. -DTARGET=irix.static.cmake 
# -----------------------------------------------------------------------------
# OpenGL renderer disabled for standard SGUG-RSE SDL2 - using software renderer

# (OPENGL and OPENGLES are intentionally left unset.)

# Default paths for SGUG-RSE installations
if(NOT sdl2_dir)
    set(sdl2_dir "/usr/sgug/lib/cmake/SDL2")
endif()

if(NOT boost_dir)
    set(boost_dir "/usr/sgug/include")
endif()

find_library(SDL2_STATIC_LIB
    NAMES libSDL2.a SDL2
    HINTS /usr/sgug/lib32
    PATH_SUFFIXES lib lib32
)
if(NOT SDL2_STATIC_LIB)
    set(SDL2_STATIC_LIB "/usr/sgug/lib32/libSDL2.a")
    message(STATUS "SDL2 static library not found automatically; using fallback: ${SDL2_STATIC_LIB}")
else()
    message(STATUS "Found SDL2 static library: ${SDL2_STATIC_LIB}")
endif()

set(platform_link_libs
    audio
    pthread
    m
)

# Static link libstdc++ so the binary does not depend on the host libstdc++.so
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libstdc++")

# SGUG-RSE gcc 9 on IRIX does not support -rdynamic; suppress it.
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

# GNU ld cannot read IRIX-native DSOs (libGLcore.so etc.).
# SDL2 loads GL via dlopen at runtime, so unresolved GL symbols from the
# static archive are safe to ignore at link time.
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--unresolved-symbols=ignore-in-object-files")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Some optimisation flags for MIPS
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -ffast-math -fno-PIC")
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
