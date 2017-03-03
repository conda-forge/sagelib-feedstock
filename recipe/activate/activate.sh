eval `python ../sage-conda-env.py activate`

export SAGE_ROOT=$CONDA_PREFIX
export SAGE_LOCAL=$CONDA_PREFIX

# For sage-env
# TODO: remove this and patch sage-env
mkdir -p "$CONDA_PREFIX/build"

source "$CONDA_PREFIX/bin/sage-env"
