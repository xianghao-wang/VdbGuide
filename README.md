# VDB Guide

This is a guide for environment setup of VDB and troubleshoot.

## Installation

### Prerequisite
- Windows
    - Install Visual Studio 2022
    - Install [vcpkg](https://github.com/microsoft/vcpkg)
- Mac
    - Install [HomeBrew](https://brew.sh/)

### Install OpenVDB alone
Strictly follow the steps introduced in [OpenVDB Github](https://github.com/AcademySoftwareFoundation/openvdb).

### Install NanoVDB with OpenVDB
- Windows: [script](./all_win.ps1)
    1. Install dependencies
        ```bash
        vcpkg install zlib:x64-windows
        vcpkg install blosc:x64-windows
        vcpkg install tbb:x64-windows
        vcpkg install boost-iostreams:x64-windows
        vcpkg install boost-any:x64-windows
        vcpkg install boost-algorithm:x64-windows
        vcpkg install boost-interprocess:x64-windows
        ```
    2. Configure and build OpenVDB & NanoVDB
        ```bash
        git clone https://github.com/AcademySoftwareFoundation/openvdb.git
        cd openvdb
        mkdir build
        cd build
        cmake .. -DUSE_NANOVDB=ON -DCMAKE_INSTALL_PREFIX="<path_to_install>" -DCMAKE_TOOLCHAIN_FILE="<path_to_vcpkg>/scripts/buildsystems/vcpkg.cmake"
        cmake --build . parallel 4 --config Release --target install
        ```

### Use NanoVDB



## Troubleshoot
- Building OpenVDB & NanoVDB:  `LINK : fatal error LNK1248: image size exceeds maximum allowable size`
    - Solution: Choose `Release` configuration rather than `Debug` during building.
- Compiling NanoVDB examples: `error: no member named ... in 'openvdb...`
    - Solution: Define `NANOVDB_USE_OPENVDB` beforing including NanoVDB headers.

## References
- [OpenVDB Github](https://github.com/AcademySoftwareFoundation/openvdb)
- [OpenVDB Build Documentation](https://www.openvdb.org/documentation/doxygen/build.html)
- [Issue 1701: [BUG] I cannot compile my code using NanoVDB](https://github.com/AcademySoftwareFoundation/openvdb/issues/1707)