
#============================
# Find the package versions. 
#============================

source scripts/do-versions.sh

#=====================================================
# Download packages from well-known source locations.
#=====================================================

mkdir -p archives

wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/gcc/gcc-$ver_gcc/gcc-$ver_gcc.tar.gz
wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/binutils/binutils-$ver_binutils.tar.gz
wget --no-check-certificate -nc -P archives https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.10.17.tar.xz
wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/glibc/glibc-$ver_glibc.tar.xz
wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/mpfr/mpfr-$ver_mpfr.tar.xz
wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/gmp/gmp-$ver_gmp.tar.xz
wget --no-check-certificate -nc -P archives http://ftpmirror.gnu.org/mpc/mpc-$ver_mpc.tar.gz
wget --no-check-certificate -nc -P archives ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-$ver_isl.tar.bz2
wget --no-check-certificate -nc -P archives ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-$ver_cloog.tar.gz
wget --no-check-certificate -nc -P archives ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-$ver_cloog.tar.gz
wget --no-check-certificate -nc -P archives https://ftp.gnu.org/gnu/gdb/gdb-$ver_gdb.tar.xz

#======================================================================
# Extract source archive into folders, skipping those already present.
#======================================================================

mkdir -p src

cd src

for f in ../archives/*.tar.*z*;
do
	b=$(basename $f)

	if [ ! -d "${b%.*.*}" ]
	then
		echo Expanding $f
		if [ `which 7z` ]
		then
			7z x -y $f
			7z x -y ${b%.*}
			rm ${b%.*}
		else
			tar xf $f
		fi
	fi
done

cd ..

#=============================================
# Create the symlinks in the GCC source tree.
#=============================================

cd src/gcc-$ver_gcc
if [ ! -e mpfr  ]; then ln -s ../mpfr-$ver_mpfr   mpfr;  fi
if [ ! -e gmp   ]; then ln -s ../gmp-$ver_gmp     gmp;   fi
if [ ! -e mpc   ]; then ln -s ../mpc-$ver_mpc     mpc;   fi
if [ ! -e isl   ]; then ln -s ../isl-$ver_isl     isl;   fi
if [ ! -e cloog ]; then ln -s ../cloog-$ver_cloog cloog; fi
cd ../..

#==========================================
# Create the build and output directories.
#==========================================

mkdir -p build/$target

mkdir -p install/$target

#=======
# Done.
#=======
