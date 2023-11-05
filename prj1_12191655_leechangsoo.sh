#!/bin/bash



echo "--------------------------
User Name: LeeChangsoo
Student Number: 12191655
[ MENU ]
1. Get the data of the movie identified by a specific
'movie id' from 'u.item'
2. Get the data of action genre movies from 'u.item’
3. Get the average 'rating’ of the movie identified by
specific 'movie id' from 'u.data’
4. Delete the ‘IMDb URL’ from ‘u.item
5. Get the data about users from 'u.user’
6. Modify the format of 'release date' in 'u.item’
7. Get the data of movies rated by a specific 'user id'
from 'u.data'
8. Get the average 'rating' of movies rated by users with
'age' between 20 and 29 and 'occupation' as 'programmer'
9. Exit
--------------------------"
stop="N"
until [ $stop = "Y" ]
do
read -p "Enter your choice [ 1-9 ] " PORT
case $PORT in
	1) read -p "Please enter 'movie id'(1~1682)" MOVIE
		awk -F"|" -v input="$MOVIE" '$1==input {print $0}' $1
	continue	
		;;
	2) read -p  "Do you want to get the data of 'action' genre movies from 'u.item'?(y/n):" YN
		case $YN in
			y) awk -F"|" 'count < 10 && $7=="1" {print $1, $2;count++;}' $1
				;;
			n)continue
				;;
		esac
	
		;;
	3)     	read -p "Please enter the 'movie id' (1~1682) :" MVID
		awk -v input="$MVID" '$2==input {sum += $3; cnt++}; END {avg = sum / cnt; print avg }' $2
		;;
	4)read -p "Do you want to delete the 'IMDb URL' from 'u.item'?(y/n) :" YN
		case $YN in
			y) awk -F"|" '{OFS="|"; $5=""; print $0}' $1 | head -n 10
			   ;;
		        n) continue
				;;
		esac
		;;
	5) read -p "Do you want to get the data about users from 'u.user'? (y/n) :" YN
		case $YN in
			y) cat $3 |awk -F"|" '{ print  "user ", $1, " is ", $2, " years old ", $3, " ", $4 }' $3 | sed 's/M/male/g' | sed 's/F/female/g' | head -n 10
				;;
			n) continue
				;;
		esac
		;;
	6)read -p "Do you want to Modify the format of 'release data' in 'u.item'?(y/n) :" YN
		case $YN in
		y) cat $1 | sed 's/-Jan-/|]01<|/g' | sed 's/-Feb-/|]02<|/g'  | sed 's/-Mar-/|]03<|/g' | sed 's/-Apr-/|]04<|/g' | sed 's/-May-/|]05<|/g' | sed 's/-Jun-/|]06<|/g' | sed 's/-Jul-/|]07<|/g' | sed 's/-Aug-/|]08<|/g' | sed 's/-Sep-/|]09<|/g' | sed 's/-Oct-/|]10<|/g' | sed 's/-Nov-/|]11<|/g' | sed 's/-Dec-/|]12<|/g' | awk -F"|" '{OFS="|"; temp=$3; $3=$5 "["; $5=">" temp; print $0}'  |sed 's/\[.*\]//g'|sed 's/<.*>//g' | tail -n 10
			;;
		n) continue
				;;
		esac
		;;
7) read -p "Please enter the 'user id' (1~943): " NUM
			awk -v input="$NUM" '$1 == input {print $2}' $2 | sort -n | tr '\n' '|' >final.txt
		 sed 's/|/ /g' final.txt
		 



		              

	
			
		 		 
               ;;
       9) stop="Y"
	  echo  "Bye!"
	       ;;
	       
	esac
         
	  
	   


done	
