
#==============
# Package Name
#==============

package=glibc

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

#============================================
# Build and install the rest of the library. 
#============================================

if [ -z $no_glibc ]
then
	set -o pipefail
	cd build/$target/$package		&&\
	make $njobs         | tee make-rest.log	&&\
	make        install | tee inst-rest.log &&\
	cd ../..				&&\
	echo OKAY.				&&\
	exit 0
else
	set -o pipefail
	cd ../..				&&\
	echo OKAY.				&&\
	exit 0
fi	

#=========
# Failed.
#=========

echo FAILED. && cd ../.. && exit 1
