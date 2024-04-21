#!/bin/bash
set -x

source $RECIPE_DIR/build-env.sh

# Bootstrap to get pyproject.toml for sagemath-standrd which defines the
# entrypoints in bin/ such as the "sage".
./bootstrap

python -m pip install --no-deps pkgs/sagemath-standard -vv

## # This does not seem to be needed anymore
## mkdir -p "$PREFIX/etc/conda/activate.d"
## mkdir -p "$PREFIX/etc/conda/deactivate.d"
## cp "$RECIPE_DIR/activate/activate.sh" "$PREFIX/etc/conda/activate.d/sage-activate.sh"
## cp "$RECIPE_DIR/activate/deactivate.sh" "$PREFIX/etc/conda/deactivate.d/sage-deactivate.sh"

## # Is this still needed?
## echo 'export MATHJAX_DIR="$SAGE_LOCAL/lib/python'$PY_VER'/site-packages/notebook/static/components/MathJax"' >> "$PREFIX/etc/conda/activate.d/sage-activate.sh"

## # Is this still needed?
## rm $PREFIX/lib64

## # Is this still needed?
## echo "$PREFIX" > "$PREFIX/lib/sage-current-location.txt"

## # Is this still needed?
## cat "$PREFIX/bin/sage-env-config"
## sed -i.bak "s@$SRC_DIR@$PREFIX@g" "$PREFIX/bin/sage-env-config"
## rm "$PREFIX/bin/sage-env-config.bak"

## # Is this still needed
## mkdir -p "$PREFIX/var/lib/sage/installed"
## touch "$PREFIX/var/lib/sage/installed/.conda"

## # Is this still needed
## mkdir -p $SRC_DIR/to-copy
## mv $SP_DIR/sage/libs/sirocco* $SRC_DIR/to-copy/
## mv $SP_DIR/sage/graphs/bliss* $SRC_DIR/to-copy/
