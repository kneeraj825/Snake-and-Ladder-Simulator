#!/bin/bash -x

echo Welcome To Snake and Ladder Game
function snakeLadder()
{
	#constants
	POSITION=0
	COUNT=0
	WINNING_POSITION=100
	PREV_POSITION=0
	#repeating till winning position
	while (( $POSITION != $WINNING_POSITION ))
	do
		#checking the random dice number
		diceCheck=$(( 1+ RANDOM%6 ))
		#checking the option
		optionCheck=$(( RANDOM%3 ))
		No_Play=0
		LADDER=1
		SNAKE=2
		#calling the function
		choice
		#counting the total dice roll
		COUNT=$(($COUNT+1))
		echo "Total number of times dice rolled: $COUNT"
	done
}
function choice()
{
	case $optionCheck in
      $No_Play)
         POSITION=$POSITION
         echo "NO_PLAY:$POSITION"
      ;;
      $LADDER)
			#checking if position goes beyond to winning position
         POSITION=$(($POSITION+$diceCheck))
         if (($POSITION>WINNING_POSITION))
         then
            POSITION=$PREV_POSITION
         fi
         echo "current position: $POSITION"
      ;;
      $SNAKE)
         POSITION=$(($POSITION-$diceCheck))
         if (($POSITION<0))
			then
             POSITION=0
         fi
         echo "current position after snake bitting: $POSITION"
         if (($POSITION<WINNING_POSITION))
         then
            PREV_POSITION=$POSITION
         fi
      ;;
   esac
}
function winner()
{
	#checking the count of both the players
	snakeLadder
	Player1=$COUNT
	echo "First Player :" $Player1
	snakeLadder
	Player2=$COUNT
	echo "Second Player :" $Player2
	#checking for the winner
	if (( $Player1 < $Player2 ))
	then
		echo "First Player is winner:$Player1"
	else
		echo "Second Player is winner:$Player2"
	fi
}
winner
