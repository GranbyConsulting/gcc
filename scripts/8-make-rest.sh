
#==============
# Package Name
#==============

package=gcc

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

#========================================
# Build and install the support library.
#========================================

set -o pipefail
cd build/$target/$package		     &&\
make $njobs         2>&1 | tee make-rest.log &&\
make $njobs install 2>&1 | tee inst-rest.log &&\
cd ../..				     &&\
echo OKAY.				     &&\
exit 0

#=========
# Failed.
#=========

echo FAILED. && cd ../.. && exit 1
