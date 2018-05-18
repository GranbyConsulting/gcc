
#==================
# BinUtils Config.
#==================

echo Using default config for binutils.

../../../src/$source/configure	\
	--prefix=$conf_prefix	\
	--target=$target	\
	--disable-nls		\
	--enable-debug		\
	--with-gcc		\
	--with-gnu-as		\
	--with-gnu-ld		\
	2>&1 | tee conf.log

#=======
# Done.
#=======
