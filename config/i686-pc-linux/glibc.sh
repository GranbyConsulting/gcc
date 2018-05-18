
#=================================
# GLibC Config for i686-pc-linux.
#=================================

../../../src/$source/configure				\
	--prefix=$conf_prefix/$target			\
	--build=$MACHTYPE				\
	--host=$target					\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	--disable-multilib				\
	2>&1 | tee conf-init.log

#=======
# Done.
#=======
