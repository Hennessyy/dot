#!/bin/bash

email=$1
file=$2

if [[ ! -z $email && ! -z $file ]];
then
    ssh-keygen -t ed25519 -C {$1} -f $2 -q -N ""
else
    echo "mksshkey requires 2 parameters './mksshkey.sh <email> <filename>'"
fi
