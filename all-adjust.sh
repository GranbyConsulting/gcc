
find config  -name '*.sh' | xargs dos2unix
find scripts -name '*.sh' | xargs dos2unix
find config  -name '*.sh' | xargs chmod +x
find scripts -name '*.sh' | xargs chmod +x

dos2unix all-make.sh
dos2unix all-clean.sh

chmod +x all-make.sh
chmod +x all-clean.sh
