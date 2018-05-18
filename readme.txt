INTRODUCTION

This repo contains a series of scripts that can be used to build cross-compiler versions
of the GCC tool chain. The tools can be built on Linux or on Windows using MSYS2. In the
latter case, you will have to make some changes to get the build to complete. See below
for the various errors that may occur, and how to fix themn.

BUILDING FOR THE FIRST TIME

This will build GCC with the target specified in the config/config.h file:

	dos2unix all-adjust.sh
	chmod +x all-adjust.sh
	./all-adjust.sh
	./all-make 1

The associated directory in config contains the target configuration information.

BARE METAL ISSUES

If STEP 8 fails when building a bare-metal tool chain:

	Locate the libstdc++ folder in the gcc source tree.
	Open the configure file in your favorite text editor.
	Search the file for a line comprising "*-vxworks)".
	The line should be followed by various $as_echo invocations.
	Above the vxworks line, add lines of "*-unknown-*)" and ";;"
	Restart from step 8, and the library will build.
	
BUILD ISSUES ON MSYS2

If STEP 2 fails when trying to expand the Linux headers:

	Perform the step on a real or virtual Linux machine.
	Locate the headers in the install/$target/include directory.
	Copy them into your src/_include/$arch/include directory.
	Restart from step 2, and the script will use the pre-copied sources.

If STEP 7 fails with a complaint about a rtld-Rules being used directly:

	Switch to the build/$target/glibc/elf directory.
	Open the librtld.map file in your favorite text editor.
	Replace the C:/MSYS2 or similar prefix with an empty string.
	Restart from step 7, and the build will continue without error.

If STEP 8 fails with a complaint about an invalid linker version file:

	Switch to the build/$target/gcc/$target/libgcc directory.
	Open the Makefile file in your favorite text editor.
	Locate the rule for the libgcc.map target.
	Pipe the output from the braces through dos2unix before awk.
	The line will start with something like } | dos2unix | $(AWK).
	You may also modify the source's Makefile.in if required.
	Restart from step 8, and the build will continue without error.

CREDITS

Inspired by http://preshing.com/20141119/how-to-build-a-gcc-cross-compiler/
