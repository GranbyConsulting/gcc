
#================
# Configuration.
#================

if [ $platform = *"arm"* ];
then
	export arch=arm
	exit 0
fi

if [ $platform = *"i686"* ];
then
	export arch=x86
	exit 0
fi

if [ $platform = *"m68k"* ];
then
	export arch=m68k
	exit 0
fi

# This will force an error.

export arch=unknown

echo Unable to find architecture from target name!

#======
# Done
#======
