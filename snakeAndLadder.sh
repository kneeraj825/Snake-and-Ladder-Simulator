#!/bin/bash -x

echo Welcome To Snake and Ladder Game
#Constant
POSITION=0
WINNING=100
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
		echo "current position: $POSITION"
	;;
	$Snake)
		POSITION=$(($POSITION-$diceCheck))
		echo "current position after snake bitting: $POSITION"
	;;
esac

