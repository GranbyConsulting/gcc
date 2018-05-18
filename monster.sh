
export target=arm-linux-gnueabihf	&&\
./all-make.sh				&&\
export target=arm-linux-gnueabi		&&\
./all-make.sh				&&\
export target=arm-eabi			&&\
./all-make.sh				&&\
export target=i686-pc-linux		&&\
./all-make.sh				&&\
export target=m68k-elf			&&\
./all-make.sh				&&\
echo MONSTER BUILD COMPLETED!

