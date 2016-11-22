#!/bin/sh

DENYHOST_FILE=$2
HOST_FILE=$3

function remove {
    if [ -f "$HOST_FILE" ]; then
        sed -i '' '/#denyhosts/d' $HOST_FILE
        flushCache
    else
        echo "Nothing to remove"
    fi
}

function append {
   if [ -f "$DENYHOST_FILE" ] && [ -f "$HOST_FILE" ]; then
        grep -v -e '^$' $DENYHOST_FILE | sed 's/\(.*\)/127.0.0.1 \1 #denyhosts/' >> $HOST_FILE
        flushCache
   else
       echo "Nothing to append"
   fi
}

function flushCache {
    dscacheutil -flushcache
}

if [ "$1" = "on" ]; then
    echo "on"
    remove
    append
elif [ "$1" = "off" ]; then
    echo "off"
    remove 
else
    echo "workmode mode=[on|off] [denyhosts_file_path] [hosts_file_path]"
fi
