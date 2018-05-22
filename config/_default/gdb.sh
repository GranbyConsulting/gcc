
#==========================
# Gdb Config for arm-eabi.
#==========================

echo Using default config for gdb.

../../../src/$source/configure		\
	--prefix=$conf_prefix		\
	--target=$target		\
	2>&1 | tee conf-gcc.log

#=======
# Done.
#=======
