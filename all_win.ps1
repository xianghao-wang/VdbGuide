$env:VDB_INSTALL_PATH = "<path_to_install>"
$env:VCPKG_CMAKE_PATH = "<path_to_vcpkg>/scripts/buildsystems/vcpkg.cmake"

# install dependencies
vcpkg install zlib:x64-windows
vcpkg install blosc:x64-windows
vcpkg install tbb:x64-windows
vcpkg install boost-iostreams:x64-windows
vcpkg install boost-any:x64-windows
vcpkg install boost-algorithm:x64-windows
vcpkg install boost-interprocess:x64-windows

# create vdb folder
git clone https://github.com/AcademySoftwareFoundation/openvdb.git
cd openvdb
mkdir build
cd build

# build openvdb
cmake .. -DUSE_NANOVDB=ON -DNANOVDB_USE_OPENVDB=ON -DCMAKE_INSTALL_PREFIX="$env:VDB_INSTALL_PATH" -DCMAKE_TOOLCHAIN_FILE="$env:VCPKG_CMAKE_PATH"



