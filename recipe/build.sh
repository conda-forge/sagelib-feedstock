#!/bin/bash

export CXXFLAGS="$CXXFLAGS -Wno-unused-function -Wno-unused-variable"
export CFLAGS="$CFLAGS -Wno-unused-function -Wno-unused-variable"
export CC=$(basename $CC)
export CXX=$(basename $CXX)
export FC=$(basename $FC)

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

mkdir -p "${SAGE_EXTCODE}/notebook-ipython"

rm -f build/pkgs/boost/spkg-configure.m4

rm $PREFIX/bin/$HOST-pkg-config
make configure
./configure --prefix="$PREFIX" --with-python="$PYTHON"

set -x

mkdir -p "$SAGE_SPKG_INST"
mkdir -p "$SAGE_DOC"


cd $SRC_DIR/build/pkgs/sage_setup/src
python setup.py install --single-version-externally-managed --record record.txt

cd $SRC_DIR/build/pkgs/sagelib/src
python setup.py install

cd $SRC_DIR/build/pkgs/sage_conf/src
python setup.py install --single-version-externally-managed --record record.txt

cd $SRC_DIR/build/pkgs/sage_docbuild/src
python setup.py install --single-version-externally-managed --record record.txt

mkdir -p "$PREFIX/etc/conda/activate.d"
mkdir -p "$PREFIX/etc/conda/deactivate.d"
cp "$RECIPE_DIR/activate/activate.sh" "$PREFIX/etc/conda/activate.d/sage-activate.sh"
cp "$RECIPE_DIR/activate/deactivate.sh" "$PREFIX/etc/conda/deactivate.d/sage-deactivate.sh"
echo 'export MATHJAX_DIR="$SAGE_LOCAL/lib/python'$PY_VER'/site-packages/notebook/static/components/MathJax"' >> "$PREFIX/etc/conda/activate.d/sage-activate.sh"

rm $PREFIX/lib64

echo "$PREFIX" > "$PREFIX/lib/sage-current-location.txt"

cat "$PREFIX/bin/sage-env-config"
sed -i.bak "s@$SRC_DIR@$PREFIX@g" "$PREFIX/bin/sage-env-config"
rm "$PREFIX/bin/sage-env-config.bak"

mkdir -p "$PREFIX/var/lib/sage/installed"
touch "$PREFIX/var/lib/sage/installed/.conda"
