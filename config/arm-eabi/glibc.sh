
#============================
# GLibC Config for arm-eabi.
#============================

../../../src/$source/configure				\
	--prefix=$conf_prefix/$target			\
	--build=$MACHTYPE				\
	--host=$target					\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	--with-arch=armv7				\
	--with-fpu=none					\
	--with-float=softfp				\
	--with-mode=arm					\
	--disable-multilib				\
	2>&1 | tee conf-init.log

#=======
# Done.
#=======
