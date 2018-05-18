
#==========================
# Gcc Config for arm-eabi.
#==========================

../../../src/$source/configure				\
	--prefix=$conf_prefix				\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	--enable-languages=c,c++			\
	--enable-debug					\
	--disable-nls					\
	--disable-multilib				\
	--disable-shared				\
	--disable-libmpx				\
	--disable-libgomp				\
	--disable-libquadmath				\
	--disable-libssp				\
	--disable-libcomp				\
	--disable-isl					\
	--with-arch=armv7-a				\
	--with-fpu=vfpv3				\
	--with-float=softfp				\
	--with-mode=arm					\
	--with-gcc					\
	--with-gnu-as					\
	--with-gnu-ld					\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
