#! /usr/local/bin/bash

if [ ! -f `dirname $0`/config.sh ]; then
  echo "Please copy config.sample.sh to config.sh and update variables. Exiting."
  exit 1
fi
. `dirname $0`/config.sh

usage()
{
cat << EOF
usage: $0 options

\/\/ Jetstash Endpoint Tester \/\/

Test or populate your shizzle. With bash. Options will override anything set in the config.sh file.

OPTIONS:
   -h      Show this message
   -n      Define the number of interations to run
   -r      Define the url of the application if different that your config

EOF
}

build_data()
{
  data=$1
  for key in "${!data[@]}"
  do
    if [[ $key != "0" ]]
    then
      value=${data[$key]}
      value="${value// /+}"
      post+="&$key=$value"
    fi
  done
}

while getopts "h n:" flag
  do
    case $flag in

    h )
      usage
      exit 1
      ;;
    n )
      iterations=$OPTARG
      ;;
    r )
      route=$OPTARG
      ;;
  esac
done

build_data $data

printf "Response:\n"
i="0"

while [[ $i -lt $iterations ]]
do
  printf "Iteration #$i: "
  curl -XPOST $route -d "$post"
  printf "\n"
  i=$[$i+1]
done
