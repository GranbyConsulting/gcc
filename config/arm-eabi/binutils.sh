
#===============================
# BinUtils Config for arm-eabi.
#===============================

../../../src/$source/configure			\
	--prefix=$conf_prefix			\
	--target=$target			\
	--enable-debug				\
	--disable-nls				\
	--disable-shared			\
	--enable-multilib			\
	--with-multilib-list=aprofile,rmprofile	\
	--with-gcc				\
	--with-gnu-as				\
	--with-gnu-ld				\
	--with-system-zlib			\
	2>&1 | tee conf.log

#=======
# Done.
#=======
