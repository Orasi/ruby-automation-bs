#!/bin/bash

# This script parses the features folder to get a list of all of the 
# current feature files and present the user with a menu to select
# which feature to run. The script then runs the selected feature(s)
# while generating a a time-stamped html report of the test results.
#
# To run the script, go to the project's root directory and type:
# bash run_tests.sh

# set the colors
red='\e[0;31m'
yellow='\e[1;33m'
green='\e[1;32m'
NC='\e[0m' # No Color

# get all of the feature files
_featurefiles=features/*.feature
for f in $_featurefiles
do
    filename=${f#features/}
    filename2=${filename%.feature}
    filenames="$filenames|$filename2"
done
list="---Run all features---|---Dry-run all features---|---Exit without doing anything---${filenames}"

# display the selection menu
echo " "
echo -e "${yellow}||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||${NC}"
# echo -e "${yellow}|||||||||||||||||||||||||||||||||||||||||||||${NC}"
echo "Please type the number of the feature you would like to run:"
OIFS=$IFS
IFS='|'
date_time=$(date +%Y%m%d_%H%M%S)
select file in ${list}; do
    if ((REPLY == 1)); then
        feature=""
        echo -e "You chose to run ${green}all features${NC}."
        report="./reports/All_Features-$date_time.html"
        break
    elif ((REPLY == 2)); then
        feature="--dry-run"
        echo -e "You chose to perform a ${green}dry-run of all features${NC}."
        report="./reports/Dry-Run_All_Features-$date_time.html"
        break
    elif ((REPLY == 3)); then
        echo "You chose to exit."
        exit
    elif [ -z "$file" ]; then
        echo -e "${red}[$REPLY] is an invalid option, please select a valid option${NC}"
    else 
        echo -e "You chose to run the feature: ${green}[$file]${NC}"
        feature="features/$file.feature"
        report="./reports/$file-$date_time.html"
        break
    fi
done
IFS=$OIFS

# display the results
command="HEADLESS=true cucumber --format html --out $report --format pretty $feature SCREENSHOTS=true"
echo "The command that will be run is:"
echo -e "${green}$command${NC}"

# run the command
echo " "
echo "Running tests..."
echo " "
HEADLESS=true cucumber --format html --out $report --format pretty $feature SCREENSHOTS=true

# finish up
echo " "
echo -e "${yellow}||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||${NC}"
echo " "
echo "Testing complete. If there were no logic issues the report should be located here:"
echo -e "${green}[$report]${NC}"
echo " "
echo -e "${yellow}||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||${NC}"
echo " "
