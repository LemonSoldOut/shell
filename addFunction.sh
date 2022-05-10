#!/bin/bash
 
read -p "Enter the first  value: " x
read -p "Enter the second value: " y
 
add(){
    arg1=$1 #arg1 gets to be the first  assigned argument (note there are no spaces)
    arg2=$2 #arg2 gets to be the second assigned argument (note there are no spaces)
 
    echo $(($arg1 + $arg2))
}
 
