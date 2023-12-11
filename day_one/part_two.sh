#!/bin/bash

# This answer is not correct - saving for reference

calculate_calibration_value () {
  local calibration_value
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

formatted_input=$(sed -e 's/one/1/g' -e 's/two/2/g' -e 's/three/3/g' -e 's/four/4/g' -e 's/five/5/g' -e 's/six/6/g' -e 's/seven/7/g' -e 's/eight/8/g' -e 's/nine/9/g' day_one/sample_input.txt)
echo $formatted_input
calculate_sum $formatted_input