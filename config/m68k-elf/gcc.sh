
#==========================
# Gcc Config for m68k-elf.
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
	--with-gcc					\
	--with-gnu-as					\
	--with-gnu-ld					\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
