#!/bin/sh
if [ "$1" = "start" ]; then
    gogen gen
fi
echo $PWD
exec "$@"
