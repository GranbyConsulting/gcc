
source scripts/0-set-env.sh

rm -rf build/$target

rm -rf install/$target
rm -f  install/bin/$target-*.*
rm -f  install/bin/$target-*
rm -rf install/lib/gcc/$target
rm -rf install/libexec/gcc/$target
rm -f  install/share/man/man1/$target-*.1

mkdir -p build/$target

mkdir -p install/$target

rm -f last-step
