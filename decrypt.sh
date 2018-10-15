#!/bin/bash

indexLetter() { echo "a b c d e f g h i j k l m n o p q r s t u v w x y z" | cut -d" " -f"$1"; }

if [ "$1" == "" ]; then exit; fi # if there are no arguments exits the program

arg=$1;     # pass the 1st argument to arg

echo
echo $arg;
echo

p1="$(for a in $(seq $(echo $arg | wc -c)); do  # scrolls the number of characters in the argument

  char="$(echo $arg | cut -b $a)"             # get each index of a in $arg
  iN="$(echo $char | grep "[0-9]")"
  #echo -n "$iN"
  if [ "$iN" == "" ]; then              # check whether each index is numbered or not

    if [[ $char == ":" ]]; then       # check if the index is ":" to be able to keep it and delete the letters only
      echo -n ":"
    else
      echo -n " "              # if it is letter exchange for space
    fi

  else
    echo -n "$char"           # passes the number without line break (-n)

  fi
done)"

p2="$(for a in $p1; do    # scrolls through p1 now with just numbers and :
  if [[ "$a" != ":" ]]; then   # if it is not ":" it means that it is number and converts it to letter
    let count++;
    #echo $a
    #echo $((a/count))
    indexLetter "$((a/count))"
  else
    echo ":"
  fi
done | tr -d '\n')"  # removes line breaks

p3="$(echo $p2 | tr "zyxwvutsrqponmlkjihgfedcba" "abcdefghijklmnopqrstuvwxyz")" # inverts to the normal alphabet

echo $p3 | tr ":" " "  # swap ":" by spaces

echo
