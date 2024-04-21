#!/bin/bash
set -x

source $RECIPE_DIR/build-env.sh

pushd pkgs/sagemath-sirocco
python setup.py build
python setup.py install
popd
