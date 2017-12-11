#!/bin/bash

function print_help {
cat << EOF
This script is for compiling jhon the ripper on OSX on OSX, feel free to hack it ;)
whatever you do with jhon the ripper is up to you.
Just run it like this:
./install_jtr
Cheers!
EOF
}

function print_done {
cat << EOF

`banner :\)`

#################################################################
#################################################################
John The Ripper installed!
just run it like this: 
`pwd`/john

#################################################################
#################################################################
EOF
}

function make_jtr {
	cwd=`pwd`
	openssl version >/dev/null
	if [ $? -ne 0 ]
	then
		brew install openssl
	fi
	cd $HOME
	git clone https://github.com/magnumripper/JohnTheRipper
	if [ $? -ne 0 ]
	then
		echo "Seems that you don't have internet :(, try again later"
		exit 1
	fi
	cd JohnTheRipper/src
	 ./configure LDFLAGS=-L/usr/local/Cellar/openssl/1.0.2m/lib CFLAGS="-O2 -I /usr/local/Cellar/openssl/1.0.2m/include"
	sed -i .old "s/^CPPFLAGS =.*/CPPFLAGS = -I\/usr\/local\/include -I\/usr\/local\/Cellar\/openssl\/1.0.2m\/include/" Makefile
	make -j8
	cd ../run
	print_done
	cd $cwd
} 


if [ $# -eq 0 ]
then
	make_jtr
else
	print_help
fi
