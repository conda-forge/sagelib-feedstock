#!/bin/bash

#eval `python "$CONDA_PREFIX/etc/conda/sage-conda-env.py" deactivate`

if [[ -n "$_CONDA_SAGE_ROOT" ]]; then
    export SAGE_ROOT="$_CONDA_SAGE_ROOT"
    unset _CONDA_SAGE_ROOT
fi

if [[ -n "$_CONDA_SAGE_LOCAL" ]]; then
    export SAGE_LOCAL="$_CONDA_SAGE_LOCAL"
    unset _CONDA_SAGE_LOCAL
fi
