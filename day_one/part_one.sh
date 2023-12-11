#!/bin/bash

calculate_calibration_value () {
  local first_number
  local last_number

  for (( i=0; i<${#1}; i++ )); do
    if [[ ${1:$i:1} =~ [0-9] ]]; then
      last_number=${1:$i:1}
      if ! [[ $first_number =~ [0-9] ]]; then
        first_number=${1:$i:1}
      fi
    fi
  done
  echo $first_number$last_number
}

calculate_sum () {
  sum=0

  for word in $@
    do
      calibration_value=$(calculate_calibration_value $word)
        sum=$((sum + calibration_value)) 
    done
  echo $sum
}

calculate_sum $(cat day_one/input.txt)