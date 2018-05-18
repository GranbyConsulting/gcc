
#=================
# Compiler Flags.
#=================

echo Using default compiler flags.

export CFLAGS='-O2 -pipe -Wno-format -Wno-maybe-uninitialized -Wno-implicit-fallthrough -Wno-expansion-to-defined -Wno-attributes'
export CXXFLAGS='-O2 -pipe -Wno-format -Wno-maybe-uninitialized -Wno-implicit-fallthrough -Wno-expansion-to-defined -Wno-attributes'
export LDFLAGS='-s'
export DEBUG_FLAGS=''

#=======
# Done.
#=======
