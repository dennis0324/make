#!/bin/bash
usage="$(basename "$0") [-h] [-s n] -- program to calculate the answer to life, the universe and everything

where:
    -l  show this help text
    -i  initialize folder structure
    -r  redownload makefile
    -m  create output for each c files
    -e  create one executable in src folder
    -l  create static library
    -c  remove makefile after run"
readonly argv_0=$(basename $0)
readonly argc=$#

name=newProject
author="JohnDoe"

if [[ -f ".makeOnlineConfig" ]]; then
	. .makeOnlineConfig
fi

while getopts "rlicmhen:" opt; do
	case "$opt" in
	h) ;;
	l)
		# library(static)
		URI="https://raw.githubusercontent.com/dennis0324/make/main/makefiles/build-static-library/Makefile"
		doCurl=true
		;;

	m)
		# multiple
		URI="https://raw.githubusercontent.com/dennis0324/make/main/makefiles/build-exmaples/Makefile"
		doCurl=true
		;;

	e)
		# executable
		URI="https://raw.githubusercontent.com/dennis0324/make/main/makefiles/build-executable/Makefile"
		doCurl=true
		;;
	i)
		initialize=true
		;;
	n)
		# name
		name=$OPTARG
		;;
	c)
		# clean
		clean=true
		;;
	r)
		redownload=true
		;;
	*)
		printf "%s: option '-%s' " $argv_0 $OPTARG
		printf "is invalid\n"

		;;
	esac
done

[[ ! -z $PROJECT_NAME ]] && name=$PROJECT_NAME
[[ ! -z $PROJECT_AUTHOR ]] && author=$PROJECT_AUTHOR

if [ $argc = 0 ]; then
	# help
	echo "$usage"
	exit 0
fi

if [[ $initialize = true ]]; then
	echo "making folder structure"
	[[ ! -d src ]] && mkdir src
	[[ ! -d include ]] && mkdir include
	[[ ! -d bin ]] && mkdir bin
fi

if [[ $redownload = true ]]; then
	echo "redownloading makefile"
	if [[ -f "Makefile" ]]; then
		rm Makefile
	fi
fi

if [[ ! -f "Makefile" ]] && [[ $doCurl = true ]]; then
	echo $URI
	curl -sS "$URI" --output "Makefile"
fi

if [ -f "Makefile" ]; then
	echo "runing makefile"
	make -f Makefile PROJECT_NAME="$name" PROJECT_AUTHOR="$author"
fi

if [[ $clean = true ]]; then
	echo "removing makefile"
	rm Makefile
fi
