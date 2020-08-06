#!/bin/bash -x 
declare -A singlet
for (( i=1; i<=7; i++ ))
do
            flip=$((RANDOM%2))
            case $flip in
                     0) face=H
                        ;;
                     1) face=T
                        ;;
            esac
				singlet[$flip]="$face"
				singletArray[j++]=$face
done
echo "The singlet combination: ${singletArray[@]}"
numberOfSingletHeads=$(echo ${singletArray[@]} | tr -cd 'H' | wc -c)
numberOfSingletTails=$(echo ${singletArray[@]} | tr -cd 'T' | wc -c)
x=$(echo "scale=2;$numberOfSingletHeads/7*100" | bc)
Heads_Singlet_Percentage=$(echo ${x%.*})
y=$(echo "scale=2;$numberOfSingletTails/7*100" | bc)
Tails_Singlet_Percentage=$(echo ${y%.*})

if [ $Heads_Singlet_Percentage -gt $Tails_Singlet_Percentage ]
then
         echo "Heads Win in singlet with a percentage of $Heads_Singlet_Percentage"
else
         echo "Tails Win in singlet with a percentage of $Tails_Singlet_Percentage"
fi

declare -A doublet
for (( i=1; i<=7; i++ ))
do
         flip=$((RANDOM%4))
         case $flip in
                   0) face=HT
                      ;;
                   1) face=HH
                      ;;
                   2) face=TH
                      ;;
                   3) face=TT
                      ;;
         esac
         doublet[$flip]=$face
         doubletArray[k++]=$face
done
echo "The doublet combination: ${doubletArray[@]}"
numberOfDoubletTails=$(echo ${doubletArray[@]} | tr -cd 'T' | wc -c)
numberOfDoubletHeads=$(echo ${doubletArray[@]} | tr -cd 'H' | wc -c)
z=$(echo "scale=2;$numberOfDoubletHeads/14*100" | bc)
Heads_Doublet_Percentage=$(echo ${z%.*})
a=$(echo "scale=2;$numberOfDoubletTails/14*100" | bc)
Tails_Doublet_Percentage=$(echo ${a%.*})

if [ $Heads_Doublet_Percentage -gt $Tails_Doublet_Percentage ]
then
               echo "Heads won in doublet with a percentage of $Heads_Doublet_Percentage"
elif [ $Heads_Doublet_Percentage -eq $Tails_Doublet_Percentage ]
then
               echo "Heads and tails made a tie in doublet with 50% each"
else
               echo "Tails won in doublet with a percentage of $Tails_Doublet_Percentage"
fi

declare -A triplet
for (( i=1; i<=7; i++ ))
do
         flip=$((RANDOM%8))
         case $flip in
                  0) face=HHT
                     ;;
                  1) face=HTH
                     ;;
                  2) face=HTT
                     ;;
                  3) face=HHH
                     ;;
                  4) face=THT
                     ;;
                  5) face=THH
                     ;;
                  6) face=TTH
                     ;;
                  7) face=TTT
                     ;;

         esac
         triplet[$face]=$percentage
         tripletArray[l++]=$face
done

echo "The triplet combination: ${tripletArray[@]}"
numberOfTripletTails=$(echo ${tripletArray[@]} | tr -cd 'T' | wc -c)
numberOfTripletHeads=$(echo ${tripletArray[@]} | tr -cd 'H' | wc -c)
b=$(echo "scale=2;$numberOfTripletHeads/21*100" | bc)
Heads_Triplet_Percentage=$(echo ${b%.*})
c=$(echo "scale=2;$numberOfTripletTails/21*100" | bc)
Tails_Triplet_Percentage=$(echo ${c%.*})

if [ $Heads_Triplet_Percentage -gt $Tails_Triplet_Percentage ]
then
               echo "Heads won in triplet with a percentage of $Heads_Triplet_Percentage"
elif [ $Heads_Triplet_Percentage -eq $Tails_Triplet_Percentage ]
then
               echo "Heads and tails made a tie in triplet with 50% each"
else
               echo "Tails won in triplet with a percentage of $Tails_Triplet_Percentage"
fi

HeadsTotalPercentage=$(($Heads_Singlet_Percentage+$Heads_Doublet_Percentage+$Heads_Triplet_Percentage))
TailsTotalPercentage=$(($Tails_Singlet_Percentage+$Tails_Doublet_Percentage+$Tails_Triplet_Percentage))
if [ $HeadsTotalPercentage -gt $TailsTotalPercentage ]
then
               echo "Heads Won with a total percentage of $HeadsTotalPercentage among singlet,doublet and triplet combination"
else
               echo "Tails Won with a total percentage of $TailsTotalPercentage among singlet,doublet and triplet combination"
fi


