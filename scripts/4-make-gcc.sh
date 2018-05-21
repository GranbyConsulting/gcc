
#==============
# Package Name
#==============

package=gcc

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

source scripts/do-config.sh

#=============================
# Force single threaded make.
#=============================

export njobs=

export PARALLELMFLAGS=$njobs

#=================================
# Force static linkage on MSYS64.
#=================================

if [ ! -z $MSYSTEM ]
then
	export CFLAGS="$CFLAGS -static -static-libgcc"
	export CXXFLAGS="$CXXFLAGS -static -static-libgcc -static-libstdc++"
	export LDFLAGS="$LDFLAGS  -static -static-libgcc -static-libstdc++"
fi

#==========================================
# Build and install the inintial compiler. 
#==========================================

set -o pipefail
make $njobs all-gcc     2>&1 | tee make-gcc.log	&&\
make $njobs install-gcc 2>&1 | tee inst-gcc.log &&\
cd ../..					&&\
echo OKAY.				        &&\
exit 0

#=========
# Failed.
#=========

echo FAILED. && cd ../.. && exit 1
