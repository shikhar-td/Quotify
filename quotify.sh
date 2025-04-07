#!/bin/bash

# Define colors
REDCOLOR="\e[31m"
NC="\e[0m"
QUOTECOLOR="\e[1;34m"
WLECOMECOLOR="\e[33m"
DATECOLOR="\e[35m"
# Initialize array index and ensure the array is empty before starting
i=0
arr=()

# Default file path
FILE_PATH="/home/alpha/Documents/quotes.txt"

# Allow the user to specify a custom file path
if [[ ! -z "$1" ]]; then
    FILE_PATH="$1"
fi

# Check if the quotes file exists
if [[ ! -f "$FILE_PATH" ]]; then
    echo -e "${REDCOLOR}Error: File not found at $FILE_PATH!${NC}"
    exit 1
fi

# Read lines from the quotes file into an array
while read -r line; do
    arr[$i]=$line
    i=$((i+1))
done < "$FILE_PATH"

# If the file is empty, exit
if [[ ${#arr[@]} -eq 0 ]]; then
    echo -e "${REDCOLOR}Error: No quotes found in the file!${NC}"
    exit 1
fi

# Display current date and time
current_time=$(date +"%Y-%m-%d %H:%M:%S")
echo -e "${WLECOMECOLOR}Current time: $current_time\n"

# Select a random quote
random=$((RANDOM % i))

# Display the output
echo -e "${REDCOLOR}---------------------------- -----------------------------------------------------------"
echo -e "${WLECOMECOLOR}            ================ Welcome back $(whoami)! ==================\n" 
echo -e "${QUOTECOLOR}${arr[$random]}"
echo -e "${REDCOLOR}---------------------------- -----------------------------------------------------------"
echo -e "${DATECOLOR}$(date +"%Y-%m-%d %H:%M:%S")"
