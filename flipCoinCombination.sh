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
