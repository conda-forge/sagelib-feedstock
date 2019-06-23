#!/bin/bash

export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CFLAGS="-w $CFLAGS"
export CXXFLAGS="-w $CXXFLAGS"

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"
#export SAGE_FAT_BINARY=yes

export SAGE_LOCAL="$PREFIX"
export SAGE_PKGS=`pwd`/build/pkgs
export SAGE_CYTHONIZED=`pwd`/build/cythonized
export SAGE_ETC="$SAGE_LOCAL/etc"
export SAGE_SHARE="$SAGE_LOCAL/share"
export SAGE_EXTCODE="$SAGE_SHARE/sage/ext"
export SAGE_SPKG_INST="$SAGE_LOCAL/var/lib/sage/installed"
export SAGE_DOC="$SAGE_SHARE/doc/sage"
export SAGE_ROOT=`pwd`


ln -s "$PREFIX" local
export SAGE_NUM_THREADS=$CPU_COUNT

make configure
./configure --prefix="$PREFIX" --with-python="$CONDA_PY"

cd src
# move the scripts
cp bin/* "$SAGE_LOCAL/bin/"

# move the extcode
mkdir -p "$SAGE_SHARE/sage"
cp -r ext "$SAGE_SHARE/sage/ext"

mkdir -p "$SAGE_SPKG_INST"
mkdir -p "$SAGE_DOC"

python -u setup.py build
# With the output of the install target we often exceeds Travis' limit of 4MB logs.
# Usually this contains nothing interesting, so just remove it completely.
python -u setup.py install >/dev/null 2>&1

# TODO: Add these in corresponding packages
rm "$PREFIX/share/jupyter/kernels/sagemath/doc"
rm "$PREFIX/share/jupyter/nbextensions/mathjax"
rm "$PREFIX/share/jupyter/nbextensions/jsmol"
rm "$PREFIX/share/jupyter/nbextensions/threejs"

mkdir -p "$PREFIX/etc/conda/activate.d"
mkdir -p "$PREFIX/etc/conda/deactivate.d"
cp "$RECIPE_DIR/activate/activate.sh" "$PREFIX/etc/conda/activate.d/sage-activate.sh"
cp "$RECIPE_DIR/activate/deactivate.sh" "$PREFIX/etc/conda/deactivate.d/sage-deactivate.sh"

ln -s $PREFIX/bin/python $PREFIX/bin/sage-python23
rm $PREFIX/lib64
