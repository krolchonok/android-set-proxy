#!/bin/bash
result=$(sudo settings get global http_proxy)
default=("Что вы хотите сделать?\n")
if [ $result == ":0" ]; then
        action=("e - включить прокси")
        echo "Прокси выключен"
else
        action=("d - выключить прокси")
        echo "Прокси: $result"
fi
exittext=("x - выйти")
printf "\n$default\n$action\n$exittext\n"
read action
if [ $action == "x" ]; then
        exit
elif [ $action == "d" ]; then
        sudo settings put global http_proxy :0
        printf "Прокси выключен\n"
        exit
elif [ $action == "e" ]; then
        printf "Введите адресс прокси: "
        read proxyip
        sudo settings put global http_proxy $proxyip
        printf "Прокси установлен: $proxyip\n"
        exit
else
        printf "Вы ввели что-то не так\n"
        exit
fi