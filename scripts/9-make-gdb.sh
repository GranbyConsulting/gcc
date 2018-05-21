
#==============
# Package Name
#==============

package=gdb

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

source scripts/do-config.sh

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
