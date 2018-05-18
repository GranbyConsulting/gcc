
#===============================
# Gcc Config for i686-pc-linux.
#===============================

../../../src/$source/configure		\
	--prefix=$conf_prefix		\
	--target=$target		\
	--enable-languages=c,c++	\
	--enable-debug			\
	--disable-nls			\
	--disable-multilib		\
	--disable-libmpx		\
	--disable-libgomp		\
	--disable-libquadmath		\
	--disable-libssp		\
	--with-gcc			\
	--with-gnu-as			\
	--with-gnu-ld			\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
