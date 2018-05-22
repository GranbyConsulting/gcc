
#============================
# GLibC Config for arm-eabi.
#============================

../../../src/$source/configure				\
	--prefix=$conf_prefix/$target			\
	--build=$MACHTYPE				\
	--host=$target					\
	--target=$target				\
	--with-headers=$inst_prefix/$target/include	\
	--enable-multilib				\
	--with-multilib-list=aprofile,rmprofile		\
	2>&1 | tee conf-init.log

#=======
# Done.
#=======
