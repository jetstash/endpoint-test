#! /bin/bash

usage()
{
cat << EOF
usage: $0 options

\/\/ Jetstash Endpoint \/\/

Test or populate your shizzle. With bash.

OPTIONS:
   -h      Show this message
   -n      Define the number of interations to run
   -u      Define the url of the application if different that your config
   -f      Define the form id

EOF
}



buildurl()
{
}


while getopts "h n:" flag
  do
    case $flag in

    h )
      usage
      exit 1
      ;;
    n )
      mode=$OPTARG
      ;;
    u )
      url=$OPTARG
      ;;
    f )
      form=$OPTARG
      ;;
  esac




done
