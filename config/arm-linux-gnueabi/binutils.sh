
#========================================
# BinUtils Config for arm-linux-gnueabi.
#========================================

../../../src/$source/configure		\
	--prefix=$conf_prefix		\
	--target=$target		\
	--enable-debug			\
	--disable-multilib		\
	--disable-nls			\
	--with-arch=armv7		\
	--with-fpu=vfpv3		\
	--with-float=soft		\
	--with-mode=arm			\
	--with-gcc			\
	--with-gnu-as			\
	--with-gnu-ld			\
	2>&1 | tee conf.log

#=======
# Done.
#=======
