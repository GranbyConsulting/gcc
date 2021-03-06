
#==============
# Package Name
#==============

package=binutils

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

source scripts/do-config.sh

#=================================
# Force static linkage on MSYS64.
#=================================

if [ ! -z $MSYSTEM ]
then
	export CFLAGS="$CFLAGS -static -static-libgcc"
	export CXXFLAGS="$CXXFLAGS -static -static-libgcc -static-libstdc++"
	export LDFLAGS="$LDFLAGS  -static -static-libgcc -static-libstdc++"
fi

#================================
# Build and install the package.
#================================

set -o pipefail
make $njobs         2>&1 | tee make.log	&&\
make $njobs install 2>&1 | tee inst.log &&\
cd ../..				&&\
echo OKAY.				&&\
exit 0

#=========
# Failed. 
#=========

echo FAILED. && cd ../.. && exit 1
