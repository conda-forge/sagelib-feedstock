#!/bin/bash

#eval `python "$CONDA_PREFIX"/etc/conda/sage-conda-env.py activate`

if [[ -n "$SAGE_ROOT" ]]; then
    export _CONDA_SAGE_ROOT=$SAGE_ROOT
fi

if [[ -n "$SAGE_LOCAL" ]]; then
    export _CONDA_SAGE_LOCAL=$SAGE_LOCAL
fi

export SAGE_ROOT="$CONDA_PREFIX"
export SAGE_LOCAL="$CONDA_PREFIX"
export THREEJS_DIR="$SAGE_LOCAL/lib/node_modules/three"
export JSMOL_DIR="$SAGE_LOCAL/share/jmol/jsmol"
export MATHJAX_DIR="$SAGE_LOCAL/lib/python*/site-packages/notebook/static/components/MathJax"

