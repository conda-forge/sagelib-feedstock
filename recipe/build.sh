#!/bin/bash
set -x

source $RECIPE_DIR/build-env.sh

# Bootstrap to get pyproject.toml for sagemath-standrd which defines the
# entrypoints in bin/ such as the "sage".
./bootstrap

# Install into the PREFIX.
# --no-deps and --no-build-isolation lets us completely ignore dependencies and
# build dependencies (which otherwise want things such as sage-setup and
# sage-conf which we do not want or need.)
python -m pip install --no-deps --no-build-isolation pkgs/sagemath-standard -vv

# Replace symlinks that point outside the prefix with files.
rm $PREFIX/share/jupyter/kernels/sagemath/logo.svg
cp pkgs/sagemath-standard/sage/ext_data/notebook-ipython/logo.svg $PREFIX/share/jupyter/kernels/sagemath/

rm $PREFIX/share/jupyter/kernels/sagemath/logo-64x64.png
cp pkgs/sagemath-standard/sage/ext_data/notebook-ipython/logo-64x64.png $PREFIX/share/jupyter/kernels/sagemath/
