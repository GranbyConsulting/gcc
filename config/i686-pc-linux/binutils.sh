
#====================================
# BinUtils Config for i686-pc-linux.
#====================================

../../../src/$source/configure	\
	--prefix=$conf_prefix	\
	--target=$target	\
	--enable-debug		\
	--disable-nls		\
	--disable-multilib	\
	--with-gcc		\
	--with-gnu-as		\
	--with-gnu-ld		\
	2>&1 | tee conf.log

#=======
# Done.
#=======
