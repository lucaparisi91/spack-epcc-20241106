set -x
set -e

source settings.sh

# Clone the git repo

cd $SPACK_INSTALL_BASE
git clone --depth=2 --branch=releases/$SPACK_VERSION https://github.com/spack/spack.git spack-$SPACK_VERSION
SPACK_ROOT=$SPACK_INSTALL_BASE/spack-$SPACK_VERSION
