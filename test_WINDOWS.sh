filename=./payment.exe

prompt="State Name: Purchase amount: Provide the month: Provide the day: Provide the year: "
validoutputprefix="Please pay a total of $"

validpurchase=30.56
invalidpurchase1=0
invalidpurchase2=-30.56

months=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
testdays=(1 31)
testyear=1000

states=("Alabama" "Alaska" "Arizona" "Arkansas" "California" "Colorado" "Connecticut" "Delaware" "Florida" "Georgia" "Hawaii" "Idaho" "Illinois" "Indiana" "Iowa" "Kansas" "Kentucky" "Louisiana" "Maine" "Maryland" "Massachusetts" "Michigan" "Minnesota" "Mississippi" "Missouri" "Montana" "Nebraska" "Nevada" "New Hampshire" "New Jersey" "New Mexico" "New York" "North Carolina" "North Dakota" "Ohio" "Oklahoma" "Oregon" "Pennsylvania" "Rhode Island" "South Carolina" "South Dakota" "Tennessee" "Texas" "Utah" "Vermont" "Virginia" "Washington" "West Virginia" "Wisconsin" "Wyoming")

taxes=(9.14 1.43 8.37 9.43 9.56 7.63 6.35 0.0 7.05 7.29 4.41 6.03 8.74 7.0 6.82 8.67 6.0 9.45 5.5 6.0 6.25 6.0 7.43 7.07 8.13 0.0 6.85 8.14 0.0 6.6 7.82 8.49 6.97 6.85 7.17 8.92 0.0 6.34 7.0 7.43 6.4 9.47 8.19 8.19 6.18 6.65 9.17 6.39 5.44 5.36)
validoutput=(33.35 31.00 33.12 33.44 33.48 32.89 32.50 30.56 32.71 32.79 31.91 32.40 33.23 32.70 32.64 33.21 32.39 33.45 32.24 32.39 32.47 32.39 32.83 32.72 33.04 30.56 32.65 33.05 30.56 32.58 32.95 33.15 32.69 32.65 32.75 33.29 30.56 32.50 32.70 32.83 32.52 33.45 33.06 33.06 32.45 32.59 33.36 32.51 32.22 32.20)

echo anderson\'s nifty thrifty project 2 tester
sleep 1
echo Starting Test...
sleep 2

# Testing Invalid Inputs
# Invalid State
printf "\n========================\nTesting Invalid State...\n"
inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "west virginia" $invalidpurchase1 "jan" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid state!" ]
then
	printf "Invalid state not handled for. Tested: %s\n" "west virginia"
else
	echo Correct!
fi

inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "north america" $invalidpurchase1 "jan" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid state!" ]
then
	printf "Invalid state not handled for. Tested: %s\n" "north america"
else
	echo Correct!
fi

# Invalid amount
printf "\nTesting Invalid Amount...\n"
inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $invalidpurchase1 "jan" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid amount!" ]
then
	printf "Invalid amount not handled for. Tested: %s\n" "$invalidpurchase1"
else
	echo Correct!
fi

inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $invalidpurchase2 "jan" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid amount!" ]
then
	printf "Invalid amount not handled for. Tested: %s\n" "$invalidpurchase2"
else
	echo Correct!
fi

# Invalid month
printf "\nTesting Invalid Month...\n"
inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "jan" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid month!" ]
then
	printf "Invalid month not handled for. Tested: %s\n" "jan"
else
	echo Correct!
fi

inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "January 5" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid month!" ]
then
	printf "Invalid month not handled for. Tested: %s\n" "January 5"
else
	echo Correct!
fi

# Invalid day
printf "\nTesting Invalid Day...\n"
inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "January" "0" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid day!" ]
then
	printf "Invalid day not handled for. Tested: %s\n" "0"
else
	echo Correct!
fi

inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "January" "32" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid day!" ]
then
	printf "Invalid day not handled for. Tested: %s\n" "32"
else
	echo Correct!
fi

# Invalid Year
printf "\nTesting Invalid Year...\n"
inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "January" "1" "0" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid year!" ]
then
	printf "Invalid year not handled for. Tested: %s\n" "0"
else
	echo Correct!
fi

inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "North Carolina" $validpurchase "January" "1" "2026" | sed "s/\\\\//g")
#echo $inputstr
TEST=$(printf "$inputstr" | $filename)
outputline=${TEST#"$prompt"}
if [ "$outputline" != "Invalid year!" ]
then
	printf "Invalid year not handled for. Tested: %s\n" "2026"
else
	echo Correct!
fi

printf "\nDone!\n"
sleep 1

# Testing Tax Free Days
printf "\n========================\nTesting Tax Free Days...\n"
Alabama=("Alabama" "July" 15 17)
Arkansas=("Arkansas" "August" 6 7)
Connecticut=("Connecticut" "August" 21 27)
Iowa=("Iowa" "August" 5 6)
Maryland=("Maryland" "August" 14 20)
Massachusetts=("Massachusetts" "August" 14 15)
Mississippi=("Mississippi" "July" 29 30)
Missouri=("Missouri" "April" 19 25)
Nevada=("Nevada" "August" 5 7)
Ohio=("Ohio" "August" 5 7)
Oklahoma=("Oklahoma" "August" 6 8)
SouthCarolina=("South Carolina" "August" 5 7)
Tennessee=("Tennessee" "July" 29 31)
Texas=("Texas" "August" 5 7)
WestVirginia=("West Virginia" "August" 5 7)

taxfree=("Alabama" "Arkansas" "Connecticut" "Iowa" "Maryland" "Massachusetts" "Mississippi" "Missouri" "Nevada" "Ohio" "Oklahoma" "SouthCarolina" "Tennessee" "Texas" "WestVirginia")

for state in "${taxfree[@]}"; do
	statename="${state}[0]"
	printf "\n%s: \n" "${!statename}"
	month="${state}[1]"
	day1="${state}[2]"
	day2="${state}[3]"
	#echo "${!statename} ${!month} ${!day1} ${!day2}"
	
	# Test day 1
	inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "${!statename}" $validpurchase "${!month}" "${!day1}" "$testyear" | sed "s/\\\\//g")
	TEST=$(printf "$inputstr" | $filename)
	outputline=${TEST#"$prompt"}
	outvalue=${outputline#"$validoutputprefix"}
	
	if [ "$outvalue" != "$validpurchase" ]
	then
		printf "Error! Tax-Free Day not handled for: %s %s %s %s \n" "${!statename}" "${!month}" "${!day1}" "$testyear"
	else
		printf "%s %s Correct!\n" "${!month}" "${!day1}"
	fi
	
	# Test day 2
	inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "${!statename}" $validpurchase "${!month}" "${!day2}" "$testyear" | sed "s/\\\\//g")
	TEST=$(printf "$inputstr" | $filename)
	outputline=${TEST#"$prompt"}
	outvalue=${outputline#"$validoutputprefix"}
	
	if [ "$outvalue" != "$validpurchase" ]
	then
		printf "Error! Tax-Free Day not handled for: %s %s %s %s \n" "${!statename}" "${!month}" "${!day2}" "$testyear"
	else
		printf "%s %s Correct!\n" "${!month}" "${!day2}"
	fi
done
printf "\nDone!\n"

sleep 1

# Testing Valid Outputs
# Iterate over each state, month, 2 days
printf "\n==================================================\nTesting Proper Calculations. Wait a few minutes...\n"
for i in "${!states[@]}"; do
	for month in "${months[@]}"; do
		for day in "${testdays[@]}"; do
			inputstr=$(printf '%q\n%f\n%s\n%s\n%s' "${states[$i]}" $validpurchase "$month" "$day" "$testyear" | sed "s/\\\\//g")
			#printf '\n%q Input: %f %s %s %s\n' "${states[$i]}" $validpurchase "$month" "$day" "$testyear" | sed "s/\\\\//g"
			
			TEST=$(printf "$inputstr" | $filename)

			outputline=${TEST#"$prompt"}
			#echo $outputline
			outprompt=${TEST%"$outputline"}
			
			# Wrong prompt text
			if [ "$outprompt" != "$prompt" ]
			then
				echo "Your prompt text is incorrect!"
				continue
			fi
			
			outvalue=${outputline#"$validoutputprefix"}
			outprefix=${outputline%"$outvalue"}
			if [ "$outprefix" != "$validoutputprefix" ]
			then
				if [ "${states[$i]}" != "Tennessee" ]
				then
					printf "\nWrong output text!\n"
					printf "%s %s %s\n" "${states[$i]}" "$month" "$day"
				fi
			#else
			#	echo "Correct Output Text!"
			fi
				# Wrong calculated value
			if [ "$outvalue" != "${validoutput[$i]}" ]
			then
				if [ "${states[$i]}" != "Tennessee" ]
				then
					printf "\nWrong calculated total!\n"
					printf "%s %s %s\n" "${states[$i]}" "$month" "$day"
					printf 'Real value: %f\n' ${validoutput[$i]}
				fi
			#else
			#	echo "Correct Output Value!"
			fi
		done
	done
done
echo Done!

echo Testing complete.

$SHELL