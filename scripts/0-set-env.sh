
#=========================
# Find the configuration.
#=========================

unset no_glibc
unset no_isl
unset no_gomp

source config/config.sh

if [ -e config/$target/config.sh ]
then
	source config/$target/config.sh
else
	source config/_default/config.sh
fi

#==============================
# Find the installation paths. 
#==============================

export inst_install=`pwd`/install

if [ ! -z $WD ]
then
	export conf_install=$(echo ${WD%\\usr\\bin*}`pwd` | sed 's/\\/\//g')/install
else
	export conf_install=$inst_install
fi

#===================================
# Set the number of jobs we'll use.
#===================================

if [ -e /proc/cpuinfo ]
then
	pcount=`grep -c ^processor /proc/cpuinfo`
else
	pcount=$NUMBER_OF_PROCESSORS
fi

if [ $pcount \> 1 ]
then
	export njobs="-j $((2 * $pcount / 3))"
else
	export njobs=
fi

unset  pcount

export PARALLELMFLAGS=$njobs

#======
# Done
#======
