import os
import sys

env_vars = ["SAGE_ENV_SOURCED", "SAGE_ROOT", "SAGE_LOCAL", "SAGE_SCRIPTS_DIR", "NAME_OF_ENVIROMENT_VARIABLE", "SAGE_ETC", "SAGE_SHARE", "SAGE_EXTCODE", "SAGE_SPKG_INST", "SAGE_LOGS", "SAGE_SRC", "SAGE_DOC_SRC", "SAGE_DOC", "SAGE_ORIG_PATH", "SAGE_ORIG_PATH_SET", "PATH", "UNAME", "MACOSX_DEPLOYMENT_TARGET", "LIBRARY_PATH", "CPATH", "GP_DATA_DIR", "GPHELP", "GPDOCDIR", "SINGULARPATH", "SINGULAR_EXECUTABLE", "SAGE_REPO_ANONYMOUS", "SAGE_REPO_AUTHENTICATED", "SAGE_DISTFILES", "DOT_SAGE", "SAGE_STARTUP_FILE", "IPYTHONDIR", "JUPYTER_CONFIG_DIR", "PYTHON_EGG_CACHE", "PYTHONUSERBASE", "PYTHONPATH", "PYTHONHOME", "LDFLAGS", "MPLCONFIGDIR", "R_MAKEVARS_SITE", "R_MAKEVARS_USER", "MAXIMA_PREFIX", "PERL", "OBJC", "OBJCXX", "CC", "F", "F77", "F90", "F95", "FC", "CXX", "CCACHE_BASEDIR", "AS", "LD", "AR", "LDFLAGS", "CXXFLAGS", "ARCHFLAGS", "CP", "MV", "RANLIB", "LN", "MKDIR", "CHMOD", "TOUCH", "PATH", "LD_LIBRARY_PATH", "ECLDIR", "SAGE_NUM_THREADS", "SAGE_NUM_THREADS_PARALLEL", "MAKE", "PIP_INSTALL", "SAGE_DOC_MATHJAX", "CYSIGNALS_CRASH_LOGS", "CYSIGNALS_CRASH_DAYS", "TERMINFO", "PERL5LIB", "SAGE64", "__sage__"]

prefix="SAGE_CONDA_OLD"


def activate_env_vars():
    new_vars = [k for k in os.environ.keys() if k.startswith(prefix)] + env_vars
    for k in new_vars:
        v = os.getenv(k, "unset")
        print("export %s_%s=\"%s\";" % (prefix, k, v))

def get_env_vars():
    old_vars = [k for k in os.environ.keys() if k.startswith(prefix)]
    return [k[(len(prefix)+1):] for k in old_vars]

def deactivate_env_vars():
    for k in get_env_vars():
        print("unset %s_%s;" % (prefix, k))

    for k in get_env_vars():
        v = os.getenv("%s_%s" % (prefix, k), "")
        if v == "unset" and not k.startswith(prefix):
            print("unset %s;" % k)
        else:
            print("export %s=\"%s\";" % (k, v))

if __name__ == "__main__":
    if sys.argv[1] == "activate":
        activate_env_vars()
    elif sys.argv[1] == "deactivate":
        deactivate_env_vars()
