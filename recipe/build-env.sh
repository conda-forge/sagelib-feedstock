# Silence very noisy Cython compilation.
export CXXFLAGS="$CXXFLAGS -Wno-unused-function -Wno-unused-variable"
export CFLAGS="$CFLAGS -Wno-unused-function -Wno-unused-variable"

# See https://github.com/conda-forge/clangdev-feedstock/issues/213
if [[ "$target_platform" == osx-* ]]; then
  export CXXFLAGS="$CXXFLAGS -fclang-abi-compat=14"
  export CFLAGS="$CFLAGS -fclang-abi-compat=14"
fi

# Compile things in parallel.
export SAGE_NUM_THREADS=$CPU_COUNT

export PYTHONPATH=$PYTHONPATH:"$PWD"/pkgs/sage-setup
