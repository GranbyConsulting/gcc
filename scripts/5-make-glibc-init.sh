
#==============
# Package Name
#==============

package=glibc

#=======================
# Perform common steps.
#=======================

source scripts/do-setup.sh

#========================
# Perform configuration.
#========================

if [ -z $no_glibc ]
then
	source scripts/do-config.sh
fi

#================================
# Install the bootstrap headers.
#================================

if [ -z $no_glibc ]
then
	if [ ! -e $inst_prefix/$target/include/a.out.h ]
	then
		make install-bootstrap-headers=yes install-headers \
		2>&1 | tee head-init.log
	fi
fi

#======================================
# Build and install the startup files. 
#======================================

if [ -z $no_glibc ]
then
	set -o pipefail
	make $njobs csu/subdir_lib 2>&1 | tee make-init.log					       &&\
	install csu/crt1.o csu/crti.o csu/crtn.o $inst_prefix/$target/lib			       &&\
	$target-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $inst_prefix/$target/lib/libc.so &&\
	touch $inst_prefix/$target/include/gnu/stubs.h					               &&\
	cd ../..										       &&\
	echo OKAY.										       &&\
	exit 0
else
	set -o pipefail
	rm -f $inst_prefix/$target/lib/libc.a
	rm -f $inst_prefix/$target/lib/libg.a
	echo "void _start(void) {}" > src/start.c						&&\
	echo "static int x = 0;"    > src/empty.c						&&\
	$target-gcc -nostdlib -nostartfiles -c src/start.c -o $inst_prefix/$target/lib/crt0.o	&&\
	$target-gcc -nostdlib -nostartfiles -c src/empty.c -o $inst_prefix/$target/lib/null.o	&&\
	$target-ar q $inst_prefix/$target/lib/libc.a $inst_prefix/$target/lib/null.o		&&\
	$target-ar q $inst_prefix/$target/lib/libg.a $inst_prefix/$target/lib/null.o		&&\
	echo OKAY.										&&\
	exit 0
fi

#========
# Failed 
#========

#echo FAILED. && cd ../.. && exit 1
