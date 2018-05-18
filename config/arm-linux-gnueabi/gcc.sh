
#===================================
# Gcc Config for arm-linux-gnueabi.
#===================================

../../../src/$source/configure			\
	--prefix=$conf_prefix			\
	--target=$target			\
	--enable-languages=c,c++		\
	--enable-debug				\
	--disable-multilib			\
	--disable-nls				\
	--disable-libmpx			\
	--disable-libgomp			\
	--disable-libquadmath			\
	--disable-libssp			\
	--with-arch=armv7-a			\
	--with-fpu=vfpv3			\
	--with-float=soft			\
	--with-mode=arm				\
	--with-gcc				\
	--with-gnu-as				\
	--with-gnu-ld				\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
