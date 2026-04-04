# -----------------------------------------------------------------------------
# CannonBall IRIX Setup (SGUG-RSE gcc 9.2.0, SDL2)
# -----------------------------------------------------------------------------
# Usage (from the cmake/ directory):
#
#   cmake .. -DTARGET=irix.cmake \
#            [-Dsdl2_dir=/usr/sgug/lib/cmake/SDL2] \
#            [-Dboost_dir=/usr/sgug/include]
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

set(platform_link_libs
    m
)

# SGUG-RSE gcc 9 on IRIX does not support -rdynamic; suppress it.
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Some optimisation flags for MIPS
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -ffast-math -fno-PIC")
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
