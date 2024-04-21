#!/bin/bash
set -x

source $RECIPE_DIR/build-env.sh

python -m pip install pkgs/sagemath-sirocco -vv
