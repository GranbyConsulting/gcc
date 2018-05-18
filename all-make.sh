
source scripts/0-set-env.sh

if [ -z $1 ]
then
	from=2
else
	from=$1
fi

([ $from \> 1 ] || (echo 1 > last-step && scripts/1-get-src.sh		)) &&\
([ $from \> 2 ] || (echo 2 > last-step && scripts/2-get-headers.sh	)) &&\
([ $from \> 3 ] || (echo 3 > last-step && scripts/3-make-binutils.sh	)) &&\
([ $from \> 4 ] || (echo 4 > last-step && scripts/4-make-gcc.sh		)) &&\
([ $from \> 5 ] || (echo 5 > last-step && scripts/5-make-glibc-init.sh	)) &&\
([ $from \> 6 ] || (echo 6 > last-step && scripts/6-make-libgcc.sh	)) &&\
([ $from \> 7 ] || (echo 7 > last-step && scripts/7-make-glibc-rest.sh	)) &&\
([ $from \> 8 ] || (echo 8 > last-step && scripts/8-make-rest.sh	)) &&\
echo Done. > last-step							   &&\
echo ALL OKAY.								   &&\
exit 0

echo FAILED IN STEP `cat last-step`.
exit 1
