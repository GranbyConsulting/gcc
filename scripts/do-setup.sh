
#=================================
# Find the main package versions.
#=================================

if [ -e config/$target/versions.sh ]
then
	source config/$target/versions.sh
else
	source config/_default/versions.sh
fi

#=================================
# Find the GCC packages versions.
#=================================

source config/gcc-$ver_gcc.sh

#==========================================
# Find the source and install directories.
#==========================================

if [ ! -x $package ]
then
	source=`ls src | grep $package`

	conf_prefix=$conf_install

	inst_prefix=$inst_install
fi

#=========================
# Set the compiler flags.
#=========================

if [ ! -x $package ]
then
	if [ -e config/$target/flags.sh ]
	then
		source config/$target/flags.sh
	else
		source config/_default/flags.sh
	fi
fi

#==================================
# Reference the target tools path.
#==================================

if [ ! -x $package ]
then
	export PATH=$inst_prefix/bin:$PATH
fi

#=======
# Done.
#=======
