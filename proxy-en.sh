#!/bin/bash
result=$(sudo settings get global http_proxy)
default=("Select:\n")
if [ $result == ":0" ]; then
        action=("e - enable proxy")
        echo "Proxy disabled"
else
        action=("d - disable proxy")
        echo "Proxy: $result"
fi
exittext=("x - exit")
printf "\n$default\n$action\n$exittext\n"
read action
if [ $action == "x" ]; then
        exit
elif [ $action == "d" ]; then
        sudo settings put global http_proxy :0
        printf "Proxy disabled\n"
        exit
elif [ $action == "e" ]; then
        printf "Enter proxy address (ip:port): "
        read proxyip
        sudo settings put global http_proxy $proxyip
        printf "Proxy set: $proxyip\n"
        exit
else
        printf "Something went wrong\n"
        exit
fi