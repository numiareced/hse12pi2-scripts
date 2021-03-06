#!/bin/bash

printarray()
{
echo ${ARRAY[*]}
}

sortarray()
{

local array=( `echo "$@"` )
local -a l
local -a g
local -a e
local x=0

if [ ${#array[@]} -lt 2 ]; then
echo -n ${array[@]}
else
local pivot=${array[0]}

for x in ${array[@]}
do

if [ $x -lt $pivot ]
then
l=( ${l[@]} $x )
elif [ $x -gt $pivot ]
then
g=( ${g[@]} $x )
else
e=(${e[@]} $x)
fi

done

echo "`sortarray "${l[@]}"` ${e[@]} `sortarray "${g[@]}"`"

fi
}

index=0
while read line; do
    ARRAY[$index]="$line"
    index=$(($index+1))
done < mas.txt

echo "Array Before Sort:"

printarray

echo "Array After Sort: "

sortarray "${ARRAY[@]}"
