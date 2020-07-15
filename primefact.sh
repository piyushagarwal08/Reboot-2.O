#!/bin/bash

if [ $# = 0 ]
then
	while [ 1 ]
	do

		read -p "Enter any number: " number
		if [ $number = 0 ] || [ $number = 1 ]
		then
			echo " "
			continue
		fi

		x=`expr $number % 2`

		while [ $x  == 0 ]
		do
			echo -n "2 "
		number=$(echo "scale=0; $number/2" | bc -l )	
		x=$(echo "scale=0; $number%2" | bc -l )
		done
	
		max=$(echo "scale=0; sqrt($number)" | bc -l )
		for ((i=3;i<=$max;i+=2))
		do
			while [ `expr $number % $i` == 0 ]
			do
				echo -n "$i "
				number=$(echo "scale=0; $number/$i" | bc -l )
			done
		done
		if [ $number -gt 2 ]
		then
			echo -n  $number
		fi
		echo ""
	done
else
	for i in $@
	do
		number=$i
		echo -n "$number: "
		if [ $number = 0 ] || [ $number = 1 ]
		then
			echo " "
			continue
		fi

		x=`expr $number % 2`

		while [ $x  == 0 ]
		do
			echo -n "2 "
		number=$(echo "scale=0; $number/2" | bc -l )	
		x=$(echo "scale=0; $number%2" | bc -l )
		done

		max=$(echo "scale=0; sqrt($number)" | bc -l )
		for ((i=3;i<=$max;i+=2))
		do
			while [ `expr $number % $i` == 0 ]
			do
				echo -n "$i "
				number=$(echo "scale=0; $number/$i" | bc -l )
			done
		done
		if [ $number -gt 2 ]
		then
			echo  $number
		fi
	done
fi

