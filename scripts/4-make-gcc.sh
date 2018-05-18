
#==============
# Package Name
#==============

package=gcc

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

source scripts/do-config.sh

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
