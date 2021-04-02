#!/bin/bash

ISSUES_MAP=( \
  [0]="Under-voltage detected" \
  [1]="Arm frequency capped" \
  [2]="Currently throttled"
  [3]="Soft temperature limit active" \
  [16]="Under-voltage has occurred" \
  [17]="Arm frequency capping has occurred" \
  [18]="Throttling has occurred" \
  [19]="Soft temperature limit has occurred")

HEX_BIN_MAP=( \
  ["0"]="0000" \
  ["1"]="0001" \
  ["2"]="0010" \
  ["3"]="0011" \
  ["4"]="0100" \
  ["5"]="0101" \
  ["6"]="0110" \
  ["7"]="0111" \
  ["8"]="1000" \
  ["9"]="1001" \
  ["A"]="1010" \
  ["B"]="1011" \
  ["C"]="1100" \
  ["D"]="1101" \
  ["E"]="1110" \
  ["F"]="1111" \
)

THROTTLED_OUTPUT=$(vcgencmd get_throttled)
IFS='x'
read -a strarr <<< "$THROTTLED_OUTPUT"
THROTTLED_CODE_HEX=${strarr[1]}

# Display current issues
echo "Current issues:"
CURRENT_HEX=${THROTTLED_CODE_HEX:4:1}
CURRENT_BIN=${HEX_BIN_MAP[$CURRENT_HEX]}
if [ "$CURRENT_HEX" == "0" ]; then
  echo "No throttling issues detected."
else
  bit_n=0
  for (( i=${#CURRENT_BIN}-1; i>=0; i--)); do
    if [ "${CURRENT_BIN:$i:1}" = "1" ]; then
      echo "~ ${ISSUES_MAP[$bit_n]}"
      bit_n=$((bit_n+1))
    fi
  done
fi

echo ""

# Display past issues
echo "Previously detected issues:"
PAST_HEX=${THROTTLED_CODE_HEX:0:1}
PAST_BIN=${HEX_BIN_MAP[$PAST_HEX]}
if [ $PAST_HEX = "0" ]; then
  echo "No throttling issues detected."
else
  bit_n=16
  for (( i=${#PAST_BIN}-1; i>=0; i--)); do
    if [ "${PAST_BIN:$i:1}" = "1" ]; then
      echo "~ ${ISSUES_MAP[$bit_n]}"
      bit_n=$((bit_n+1))
    fi
  done
fi
