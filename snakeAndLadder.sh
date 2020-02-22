#!/bin/bash -x

echo Welcome To Snake and Ladder Game
#Constant
POSITION=0
WINNING=100
PREVPOSITION=0
COUNT=0
#repeating till winning position
while (( $POSITION != $WINNING ))
do
#checking the random dice number
	diceCheck=$(( 1+ RANDOM%6 ))
#checking the option
	optionCheck=$(( RANDOM%3 ))
	No_Play=0
	Ladder=1
	Snake=2
	case $optionCheck in
		$No_Play)
			POSITION=$POSITION
			echo "NO_PLAY:$POSITION"
		;;
		$Ladder)
			POSITION=$(($POSITION+$diceCheck))
#checking if position goes beyond to winning position 
			if (($POSITION>WINNING))
			then
				POSITION=$PREVPOSITION
			fi
			echo "current position: $POSITION"
		;;
		$Snake)
			POSITION=$(($POSITION-$diceCheck))
			if (($POSITION<0))
			then
				POSITION=0
			fi
			echo "current position after snake bitting: $POSITION"
		;;
	esac
#counting the total dice roll
	COUNT=$(($COUNT+1))
	echo "Total number of times dice rolled: $COUNT"
done
