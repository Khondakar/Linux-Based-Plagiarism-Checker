#!/bin/bash
# Note: Plagiarism Checker & Showing Matching Percentage(%)
# Date: 20/Aug/2020
# Author: Khondakar

trap '' 2  # No control + c allowed

# Function:
filechecking(){
	# Main file:
	echo -n "Choose the Main Assignment File : "
	read mainfile

	# Compare a file
	echo -n "Choose a file to compare with : "
	read comparefile
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
	echo -e "\e[30;48;5;82mMATCHING ARE IN RED HIGHLIGHTED & DIFFERENCES ARE IN WHITE:       \e[0m"
		
	# Red higlighted=matching & White highlighted=differences 
	sudo grep --color=always -Ff "$mainfile" "$comparefile"
	
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line

	# show difference column wise
	# sudo diff -y "$mainfile" "$comparefile" 

	# Unified format and ignore case
	# sudo diff -ui "$mainfile" "$comparefile"
		
	echo -e "\e[30;48;5;82mCOMPARISON & SIMILARITY WITH PERCENTAGE (%) BELOW:                \e[0m"
	# Install 'wdiff' to check percentage(%) of similarity and differences
	wdiff -s "$mainfile" "$comparefile"
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
}

showfiles(){
	# check the files in a directory ~/workSpace/PlagiarismChecker/
	ls -l
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
}

while true
do
  	clear # clear screen for each loop of menu
  	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
	
	echo -e "\e[30;48;5;214m                                                                  \e[0m"
  	echo -e "\e[30;48;5;214m\e[1m                   PLAGIARISM CHECKER                             \e[0m" 
	echo -e "\e[30;48;5;214m                                                                  \e[0m"  	
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
  	echo -e "\e[30;48;5;214m\e[1mCHOOSE FROM THE BELOW OPTIONS:                                    \e[0m" 
	echo -e "\e[30;48;5;214m                                                                  \e[0m"
	echo -e "\e[30;48;5;214m[1] Show available files in current directory.                    \e[0m" 
	echo -e "\e[30;48;5;214m[2] Check files/assignments.                                      \e[0m"
	echo -e "\e[30;48;5;214m[3] Exit or Quit.                                                 \e[0m"
	echo -e "\e[30;48;5;214m                                                                  \e[0m"	
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line
	echo -n "Please select number and press <ENTER> key :  " 
 	read usrinput  # Create variable to retains the answer
	echo -e "\e[30;48;5;238m                                                                  \e[0m" # Grey Line	
	case "$usrinput" in
   		1) showfiles ;;	
   		2) filechecking ;;
   		3) exit ;;		# Exit from the Main Menu
  	esac
  	echo -e "\e[31mPress the <ENTER> key to continue.."
  	read input # This cause a pause so we can read the output
  		   # of the selection before the loop clear the screen
done




