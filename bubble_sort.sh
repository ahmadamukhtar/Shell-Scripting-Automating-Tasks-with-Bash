#!/bin/bash

# Bubble Sort in Bash

# Hardcoded array
arr=(64 34 25 12 22 11 90)

# Get the length of the array
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Bubble sort algorithm
# Outer loop goes through the entire array
for ((i = 0; i < n-1; i++))
do
    # Inner loop goes through the array up to the last unsorted element
    for ((j = 0; j < n-i-1; j++))
    do
        # Compare adjacent elements
        if [ ${arr[j]} -gt ${arr[$((j+1))]} ]
        then
            # Swap elements if they are in the wrong order
            temp=${arr[j]}
            arr[$j]=${arr[$((j+1))]}
            arr[$((j+1))]=$temp
        fi
    done
done

# Print the sorted array
echo "Sorted Array: ${arr[@]}"
