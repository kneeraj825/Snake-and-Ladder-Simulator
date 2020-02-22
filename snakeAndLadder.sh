#!/bin/bash -x

echo Welcome To Snake and Ladder Game
function snakeLadder()
{
#constants
POSITION=0
COUNT=0
WINNING=100
PREVPOSITION=0
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
#checking if position goes beyond to winning position 
			POSITION=$(($POSITION+$diceCheck))
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
         if (($POSITION<WINNING))
         then
            PREVPOSITION=$POSITION
         fi
      ;;
   esac
#counting the total dice roll
COUNT=$(($COUNT+1))
echo "Total number of times dice rolled: $COUNT"
done
}
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

