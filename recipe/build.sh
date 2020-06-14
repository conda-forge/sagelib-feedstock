#!/bin/bash

export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CXXFLAGS="$CXXFLAGS -Wno-unused-function -Wno-unused-variable"
export CFLAGS="$CFLAGS -Wno-unused-function -Wno-unused-variable"

export SAGE_LOCAL="$PREFIX"
export SAGE_PKGS=`pwd`/build/pkgs
export SAGE_CYTHONIZED=`pwd`/build/cythonized
export SAGE_ETC="$SAGE_LOCAL/etc"
export SAGE_SHARE="$SAGE_LOCAL/share"
export SAGE_EXTCODE="$SAGE_SHARE/sage/ext"
export SAGE_SPKG_INST="$SAGE_LOCAL/var/lib/sage/installed"
export SAGE_DOC="$SAGE_SHARE/doc/sage"
export SAGE_ROOT=`pwd`
export MATHJAX_DIR="$SAGE_LOCAL/lib/python$PY_VER/site-packages/notebook/static/components/MathJax"

#ln -s "$PREFIX/bin/python" "$PREFIX/bin/sage-system-python"
ln -s "$PREFIX" local
export SAGE_NUM_THREADS=$CPU_COUNT

sed -i.bak "s/@LINBOXSAGE_LIBS@//g" $PREFIX/lib/pkgconfig/linbox.pc
mkdir -p "${SAGE_EXTCODE}/notebook-ipython"

make configure
./configure --prefix="$PREFIX" --with-python="$CONDA_PY"

set -x
cd src
# move the scripts
cp bin/* "$SAGE_LOCAL/bin/"

mkdir -p "$SAGE_SPKG_INST"
mkdir -p "$SAGE_DOC"

python -u setup.py build
python -u setup.py install

mkdir -p "$PREFIX/etc/conda/activate.d"
mkdir -p "$PREFIX/etc/conda/deactivate.d"
cp "$RECIPE_DIR/activate/activate.sh" "$PREFIX/etc/conda/activate.d/sage-activate.sh"
cp "$RECIPE_DIR/activate/deactivate.sh" "$PREFIX/etc/conda/deactivate.d/sage-deactivate.sh"
echo 'export MATHJAX_DIR="$SAGE_LOCAL/lib/python'$PY_VER'/site-packages/notebook/static/components/MathJax"' >> "$PREFIX/etc/conda/activate.d/sage-activate.sh"

rm $PREFIX/lib64

echo "$PREFIX" > "$PREFIX/lib/sage-current-location.txt"

mkdir -p "$PREFIX/var/lib/sage/installed"
touch "$PREFIX/var/lib/sage/installed/.conda"
