#!/bin/sh

WORKMODE={{ scripts_dir }}/workmode.sh
DENYHOSTS={{ ansible_user_dir }}/.denyhosts

if [ "$1" = "on" ]; then
    $WORKMODE on $DENYHOSTS /etc/hosts
elif [ "$1" = "off" ]; then
    $WORKMODE off $DENYHOSTS /etc/hosts
fi