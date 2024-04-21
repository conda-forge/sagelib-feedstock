#!/bin/bash
set -x

source $RECIPE_DIR/build-env.sh

pushd pkgs/sagemath-bliss
python setup.py build
python setup.py install
popd
