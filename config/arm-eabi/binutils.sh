
#===============================
# BinUtils Config for arm-eabi.
#===============================

../../../src/$source/configure	\
	--prefix=$conf_prefix	\
	--target=$target	\
	--enable-debug		\
	--disable-nls		\
	--disable-multilib	\
	--disable-shared	\
	--with-arch=armv7	\
	--with-fpu=none		\
	--with-float=softfp	\
	--with-mode=arm		\
	--with-gcc		\
	--with-gnu-as		\
	--with-gnu-ld		\
	2>&1 | tee conf.log

#=======
# Done.
#=======
