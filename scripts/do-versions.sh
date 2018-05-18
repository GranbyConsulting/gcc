
#============================
# Find the package versions.
#============================

if [ -e config/$target/versions.sh ]
then
	source config/$target/versions.sh
else
	source config/_default/versions.sh
fi

#=======
# Done.
#=======
