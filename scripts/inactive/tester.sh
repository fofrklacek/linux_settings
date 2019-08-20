#!/bin/bash
#Path=~/Downloads


if gcc -Wall -pedantic -o $1.out $1.c
then
	echo "kompilace probehla uspesne"
else 
	echo "chyba pri kompilaci"
	return 1
fi


POC_CYKLU=`cut -d$'\n' -f 1 <.testovane_vstupy.c`
VEL_VSTUPU=`cut -d$'\n' -f 2 <.testovane_vstupy.c`

for i in {0..(($POC_CYKLU-1)) } 
do
	VSTUP=""
	for j in {0..(($VEL_VSTUPU-1)) } 
	do
		VSTUP="$VSTUP$(cut -d$'\n' -f $i*($VEL_VSTUPU+1)+$j+4 <.testovane_vstupy.c)"
	done
	./$1.out <<< VSTUP	>.muj_vystup.txt
	while $(wc -l .muj_vystup.txt) -ne $i*($VEL_VSTUPU+1)+$j+4
	do
		echo "" >.muj_vystup
	done
	
done






for i in {00..17} ; do
  echo -n "Test $i: "
  "$Path"/uloha02a.out < "$Path"/testData/00$i\_in.txt > "$Path"/testData/00$i\_out.txt
  if ! diff "$Path"/testData/00$i\_ref.txt "$Path"/testData/00$i\_out.txt ; then
    echo "failed";
  else 
  	echo "OK";
  fi
done
