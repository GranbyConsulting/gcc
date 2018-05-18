
#=======================================
# GLibC Config for arm-linux-gnueabihf.
#=======================================

../../../src/$source/configure				\
	--prefix=$conf_prefix/$target			\
	--build=$MACHTYPE				\
	--host=$target					\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	--disable-multilib				\
	--with-arch=armv7				\
	--with-fpu=vfpv3				\
	--with-float=hard				\
	--with-mode=arm					\
	2>&1 | tee conf-init.log

#=======
# Done.
#=======
