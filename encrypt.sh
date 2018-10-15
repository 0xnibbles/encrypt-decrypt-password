#!/bin/bash

index() { echo "a b c d e f g h i j k l m n o p q r s t u v w x y z" | cut -d"$1" -f1 | tr " " "\n" | wc -l; }

random() { echo "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" | cut -d" " -f $(((RANDOM%25)+1)); }

if [ "$1" == "" ]; then exit; fi

arg=$1;

echo
echo "String original: $arg"
echo

p1="$(echo $arg | tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba")" # inverts the alphabet
p2="$(echo $p1 | tr " " ":")"   # swap spaces by ":"
p3="$(echo $p2 | tr "\n" "@")"  # switch \n(newline) by @

p4="$(for a in $(seq $(echo -n "$p3"| wc -c)); do # scrolls the number of characters in the argument
  char="$(echo "$p3" | cut -b $a)"  # get the index of $a in the sentence (p3)

  iL="$(echo $char | grep "[a-z]")" # stores iL if it's a letter
   #index $char
  if [ "$iL" != "" ]; then       # if it's a letter converts it if not, keeps a special character
    index $char
  else
    echo "$char"
  fi
   #echo $iL $char
done | tr "\n" " ")"          # for each iteration exchange \n(newline) for space

p5="$(for a in $p4; do
  iN="$(echo $a | grep "[1-9]")"
  if [[ $iN != "" ]]; then
    let count++;
    echo -n "$(($count * $a))$(random)"
    r=$(random)
    #echo $count;
  else
    echo -n "$a$(random)"
  fi
done)"
echo "$p5"
echo
