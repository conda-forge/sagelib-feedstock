#!/bin/bash

if [[ -n "$SAGE_PKGS" ]]; then
    export _CONDA_SAGE_PKGS=$SAGE_PKGS
fi

export SAGE_PKGS="$CONDA_PREFIX/var/lib/sage/installed"
