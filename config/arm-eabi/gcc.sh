
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
	--disable-shared				\
	--disable-libmpx				\
	--disable-libgomp				\
	--disable-libquadmath				\
	--disable-libssp				\
	--disable-libcomp				\
	--disable-isl					\
	--enable-multilib				\
	--with-multilib-list=aprofile,rmprofile		\
	--with-gcc					\
	--with-gnu-as					\
	--with-gnu-ld					\
	--with-system-zlib				\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
