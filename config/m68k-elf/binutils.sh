
#===============================
# BinUtils Config for m68k-elf.
#===============================

../../../src/$source/configure	\
	--prefix=$conf_prefix	\
	--target=$target	\
	--enable-debug		\
	--disable-nls		\
	--disable-multilib	\
	--disable-shared	\
	--with-gcc		\
	--with-gnu-as		\
	--with-gnu-ld		\
	2>&1 | tee conf.log

#=======
# Done.
#=======
