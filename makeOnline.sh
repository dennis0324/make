#!/bin/bash
usage="$(basename "$0")

where:
    -l  show this help text
    -i  [i]nitialize folder structure
    -r  [r]edownload makefile
    -m  create output for each c files
    -e  create one [e]xecutable in src folder
    -l  create static [l]ibrary
    -c  [c]lear makefile after run
    -a  make command [a]lias
    -n  change [n]ame of the project
    -N  change [N]ame of the Author
    "
readonly argv_0=$(basename $0)
readonly argc=$#

name=newProject
author="JohnDoe"

if [[ -f ".makeOnlineConfig" ]]; then
	. .makeOnlineConfig
fi

while getopts "rlicmhen:N:" opt; do
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
		sed -i "s/PROJECT_NAME=.*/PROJECT_NAME=$name/g" .makeOnlineConfig
		if [[ -f Makefile ]]; then
			sed -i "s/PROJECT_NAME = .*/PROJECT_NAME = $name/g" Makefile
		fi
		echo changed name $PROJECT_NAME to $name
		rename=true
		;;
	N)
		# author
		author=$OPTARG
		sed -i "s/PROJECT_AUTHOR=.*/PROJECT_AUTHOR=$author/g" .makeOnlineConfig
		if [[ -f Makefile ]]; then
			sed -i "s/PROJECT_AUTHOR = .*/PROJECT_AUTHOR = $author/g" Makefile
		fi
		echo changed name $PROJECT_AUTHOR to $author
		rename=true
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
	sed -i "s/PROJECT_NAME = .*/PROJECT_NAME = $name/g" Makefile
	sed -i "s/PROJECT_AUTHOR = .*/PROJECT_AUTHOR = $author/g" Makefile
	if [ ! -f ".makeOnlineConfig" ]; then
		curl -sS "https://raw.githubusercontent.com/dennis0324/make/main/config/.makeOnlineConfig" --output ".makeOnlineConfig"
		sed -i "s/PROJECT_NAME=.*/PROJECT_NAME=$name/g" .makeOnlineConfig
		sed -i "s/PROJECT_AUTHOR=.*/PROJECT_AUTHOR=$author/g" .makeOnlineConfig
	fi
fi

if [[ -f "Makefile" ]] && [[ ! $rename ]]; then
	echo "runing makefile"
	make -f Makefile PROJECT_NAME="$name" PROJECT_AUTHOR="$author"
fi

if [[ $clean = true ]]; then
	echo "removing makefile"
	rm Makefile
fi
