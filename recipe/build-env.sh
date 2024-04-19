# Silence very noisy Cython compilation.
export CXXFLAGS="$CXXFLAGS -Wno-unused-function -Wno-unused-variable"
export CFLAGS="$CFLAGS -Wno-unused-function -Wno-unused-variable"

## # Why is this necessary?
## export CC=$(basename $CC)
## export CXX=$(basename $CXX)
## export FC=$(basename $FC)

## # These are probably not necessary anymore. (ArchLinux does not have these anymore.)
## export SAGE_LOCAL="$PREFIX"
## export SAGE_PKGS=`pwd`/build/pkgs
## export SAGE_CYTHONIZED=`pwd`/build/cythonized
## export SAGE_ETC="$SAGE_LOCAL/etc"
## export SAGE_SHARE="$SAGE_LOCAL/share"
## export SAGE_EXTCODE="$SAGE_SHARE/sage/ext"
## export SAGE_SPKG_INST="$SAGE_LOCAL/var/lib/sage/installed"
## export SAGE_DOC="$SAGE_SHARE/doc/sage"
## export SAGE_ROOT=`pwd`
## export MATHJAX_DIR="$SAGE_LOCAL/lib/python$PY_VER/site-packages/notebook/static/components/MathJax"

# See https://github.com/conda-forge/clangdev-feedstock/issues/213
if [[ "$target_platform" == osx-* ]]; then
  export CXXFLAGS="$CXXFLAGS -fclang-abi-compat=14"
  export CFLAGS="$CFLAGS -fclang-abi-compat=14"
fi

## # This is probably not necessary anymore.
## ln -s "$PREFIX" local

# Compile things in parallel.
export SAGE_NUM_THREADS=$CPU_COUNT

## # This is probably not necessary anymore.
## mkdir -p "${SAGE_EXTCODE}/notebook-ipython"

## # This is probably not necessary anymore.
## mkdir -p "$SAGE_SPKG_INST"
## mkdir -p "$SAGE_DOC"

export PYTHONPATH=$PYTHONPATH:"$PWD"/pkgs/sage-setup
