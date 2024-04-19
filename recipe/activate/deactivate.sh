#!/bin/bash

if [[ -n "$_CONDA_SAGE_PKGS" ]]; then
    export SAGE_LOCAL="$_CONDA_SAGE_PKGS"
    unset _CONDA_SAGE_PKGS
else
    unset SAGE_PKGS
fi
