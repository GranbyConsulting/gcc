
#===============================================
# Configure the package if not already done so.
#===============================================

mkdir -p build/$target/$package

cd build/$target/$package

if [ ! -e Makefile ]
then
	if [ -e ../../../config/$target/$package.sh ]
	then
		source ../../../config/$target/$package.sh
	else
		source ../../../config/_default/$package.sh
	fi
fi

#=======
# Done.
#=======
