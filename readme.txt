
This repo contains a series of scripts that can be used to build cross-compiler versions
of the GCC tool chain. The tools can be built on Linux or on Windows using MSYS. In the
latter case, you will have to make some changes to get the build to complete.

This will build GCC with the target specified in the config/config.h file:

	dos2unix all-adjust.sh
	chmod +x all-adjust.sh
	./all-adjust.sh
	./all-make 1

The associated directory in config contains the target configuration information.
