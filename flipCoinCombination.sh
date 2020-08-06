#!/bin/bash -x
flip=$((RANDOM%2))
case $flip in
			0) echo "Heads"
				;;
			1) echo "Tails"
				;;
esac
