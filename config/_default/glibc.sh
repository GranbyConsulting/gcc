
#===============
# GLibC Config.
#===============

echo Using default config for glibc.

../../../src/$source/configure				\
	--prefix=$conf_prefix/$target			\
	--build=$MACHTYPE				\
	--host=$target					\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	2>&1 | tee conf-init.log

#=======
# Done.
#=======
