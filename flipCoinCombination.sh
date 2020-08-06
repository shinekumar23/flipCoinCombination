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
echo "Heads Singlet percentage is $Heads_Singlet_Percentage"
echo "Tails Singlet percentage is $Tails_Singlet_Percentage"

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
echo "The doublet Heads Percentage is $Heads_Doublet_Percentage"
echo "The doublet Tails Percentage is $Tails_Doublet_Percentage"

