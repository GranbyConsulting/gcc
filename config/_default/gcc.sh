
#=============
# Gcc Config.
#=============

echo Using default config for gcc.

../../../src/$source/configure		\
	--prefix=$conf_prefix		\
	--target=$target		\
	--enable-languages=c,c++	\
	--enable-debug			\
	--disable-nls			\
	--with-gcc			\
	--with-gnu-as			\
	--with-gnu-ld			\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
