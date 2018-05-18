
#==============
# Package Name
#==============

package=linux

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

source scripts/do-versions.sh

#=============================================
# Modify the symlinks in the GCC source tree.
#=============================================

cd src/gcc-$ver_gcc

if [ ! -z $no_isl ]
then
	rm -rf isl
else
	if [ ! -e isl ]
	then
		ln -s ../isl-$ver_isl isl
	fi
fi

if [ ! -z $no_cloog ]
then
	rm -rf cloog
else
	if [ ! -e cloog ]
	then
		ln -s ../cloog-$ver_cloog cloog
	fi
fi

cd ../..

#=======================================
# Install the Linux or Generic headers.
#=======================================

cd src

if [ -z $no_glibc ]
then
	if [ -d _include/$arch/include ]
	then
		if [ ! -d $inst_prefix/$target/include/asm ]
		then
			mkdir -p  $inst_prefix/$target/include
			cp    -rf _include/$arch/include $inst_prefix/$target
		fi
	else
		cd $source
		make ARCH=$arch INSTALL_HDR_PATH=$inst_prefix/$target headers_install
		cd ..
	fi
else
	mkdir -p  $inst_prefix/$target/include
	cp    -rf _include/generic/glibc/include $inst_prefix/$target
fi

cd ..

#=======
# Done.
#=======
