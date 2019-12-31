#!/bin/bash

#eval `python "$CONDA_PREFIX/etc/conda/sage-conda-env.py" deactivate`

if [[ -n "$_CONDA_SAGE_ROOT" ]]; then
    export SAGE_ROOT="$_CONDA_SAGE_ROOT"
    unset _CONDA_SAGE_ROOT
else
    unset SAGE_ROOT
fi

if [[ -n "$_CONDA_SAGE_LOCAL" ]]; then
    export SAGE_LOCAL="$_CONDA_SAGE_LOCAL"
    unset _CONDA_SAGE_LOCAL
else
    unset SAGE_LOCAL
fi

if [[ -n "$_CONDA_SAGE_PKGS" ]]; then
    export SAGE_LOCAL="$_CONDA_SAGE_PKGS"
    unset _CONDA_SAGE_PKGS
else
    unset SAGE_PKGS
fi
