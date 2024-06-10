# Silence very noisy Cython compilation.
export CXXFLAGS="$CXXFLAGS -Wno-unused-function -Wno-unused-variable"
export CFLAGS="$CFLAGS -Wno-unused-function -Wno-unused-variable"

# See https://github.com/conda-forge/clangdev-feedstock/issues/213
if [[ "$target_platform" == osx-* ]]; then
  export CXXFLAGS="$CXXFLAGS -fclang-abi-compat=14"
  export CFLAGS="$CFLAGS -fclang-abi-compat=14"
fi

# farey.cpp uses bind2nd which has been removed from C++17
export CXXFLAGS="$CXXFLAGS -std=c++14"

# Compile things in parallel.
export SAGE_NUM_THREADS=$CPU_COUNT

export PYTHONPATH=$PYTHONPATH:"$PWD"/pkgs/sage-setup
