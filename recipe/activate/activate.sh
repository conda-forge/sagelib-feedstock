#!/bin/bash

#eval `python "$CONDA_PREFIX"/etc/conda/sage-conda-env.py activate`

if [[ -n "$SAGE_ROOT" ]]; then
    export _CONDA_SAGE_ROOT=$SAGE_ROOT
fi

if [[ -n "$SAGE_LOCAL" ]]; then
    export _CONDA_SAGE_LOCAL=$SAGE_LOCAL
fi

if [[ -n "$SAGE_PKGS" ]]; then
    export _CONDA_SAGE_PKGS=$SAGE_PKGS
fi

export SAGE_ROOT="$CONDA_PREFIX"
export SAGE_LOCAL="$CONDA_PREFIX"
export SAGE_PKGS="$CONDA_PREFIX/var/lib/sage/installed"
