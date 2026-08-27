#! /bin/bash

########## Initial Step: Required only once for Headers ###########
# Creating header for the log file:
#---- Option 1: Using tab \t for headers and storing records---#
#header=$(echo -e "city\tyear\tmonth\tday\tcurr_day_temp_C\tnext_day_temp_C")
#echo "$header">rx_poc.log
#------------------------------------#
#---- Option 2: Using print formatting for better readability#
# Using print format for proper formatting of the table in log file
# %-10s: %s= print a string, 10= reserve 10 characters, -= left align format
#printf "%-10s %-10s %-10s %-10s %-15s %-15s\n" \
#"city" "year" "month" "day" "curr_day_temp_C" "next_day_temp_C" > rx_poc.log

###################################################################


######### Main Section #######################

### User Input ###
echo "Enter any city of your choice in Germany"
read city

#### Scrape data from the site ####
curl -s wttr.in/$city?T --output weather_report


#Current temperature Extract:
#By default, jq preserves JSON formatting, so using option -r indicates to get raw output
obs_temp=$(curl -s wttr.in/$city?format=j1| jq -r '.current_condition[0].temp_C')
echo "The current temperature of $city is: $obs_temp"
#Extract the following day's temperature:
fc_temp=$(curl -s wttr.in/$city?format=j1 | jq -r '.weather[1].avgtempC')
a_date=$(curl -s wttr.in/$city?format=j1 | jq -r '.weather[1].date')
echo "Average Temperature of $city on $a_date is $fc_temp"
#Assign Country and City to variable TZ
TZ='Europe/Berlin'
# Use command substitution to store the current day, month, and year in corresponding shell variables:
curr_day=$(TZ='Europe/Berlin' date -u +%d) 
curr_month=$(TZ='Europe/Berlin' date +%m)
curr_year=$(TZ='Europe/Berlin' date +%Y)
#Merge the data:
record=$(echo -e "$city$curr_year\t$curr_month\t$curr_day\t$obs_temp\t$fc_temp")

## Append the record in the log file ##
printf "%-10s %-10s %-10s %-10s %-15s %-15s\n" \
"$city" "$curr_year" "$curr_month" "$curr_day" "$obs_temp" "$fc_temp" >> rx_poc.log