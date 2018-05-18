
#=========================
# Set the compiler flags.
#=========================

if [ -e config/$target/flags.sh ]
then
	source config/$target/flags.sh
else
	source config/_default/flags.sh
fi

#==========================================
# Find the source and install directories.
#==========================================

source=`ls src | grep $package`

conf_prefix=$conf_install

inst_prefix=$inst_install

#==================================
# Reference the target tools path.
#==================================

export PATH=$inst_prefix/bin:$PATH

#=======
# Done.
#=======
