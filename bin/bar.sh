#!/bin/bash

clock() {
  DATETIME=$(date "+%a %b %d, %T")
  echo -n "$DATETIME"
}

temp() {
  sensors|awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}'
}

while true; do
  BAR_INPUT="%{c}$(clock)"
  echo $BAR_INPUT
done