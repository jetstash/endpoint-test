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

\/\/ Jetstash Endpoint \/\/

Test or populate your shizzle. With bash. Options will override anything set in the config.sh file.

OPTIONS:
   -h      Show this message
   -n      Define the number of interations to run
   -u      Define the url of the application if different that your config
   -f      Define the form id

EOF
}

builddata()
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

buildurl()
{
  route="$url/v1/form/submit?$post"
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
    u )
      url=$OPTARG
      ;;
    f )
      form=$OPTARG
      ;;
  esac
done

builddata $data
buildurl $url $post

echo $url
echo $post
echo $route