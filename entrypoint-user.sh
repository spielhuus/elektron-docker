#!/bin/bash
set -e

IP=`awk 'END{print $1}' /etc/hosts`

cd $WORKSPACE

first_arg="$1"
shift

source /opt/venv/bin/activate

case $first_arg in
    serve)
      make
      hugo serve --bind=$IP --baseURL="http://$IP:1313/" $@
        ;;
    build)
      make build
        ;;
    clean)
        make clean
        ;;
    distclean)
        make distclean
        ;;
    *)
        if [ -n "$COOKIE" ]; then
            export DISPLAY=$DISPLAY
            xauth add $COOKIE
        fi
        $first_arg $@
        ;;
esac
