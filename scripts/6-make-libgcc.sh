
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
cd build/$target/$package				     &&\
make $njobs all-target-libgcc     2>&1 | tee make-libgcc.log &&\
make $njobs install-target-libgcc 2>&1 | tee inst-libgcc.log &&\
cd ../..						     &&\
echo OKAY.						     &&\
exit 0

#=========
# Failed.
#=========

echo FAILED. && cd ../.. && exit 1
