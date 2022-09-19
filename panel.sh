#!/bin/bash

while true
do

# Logo

echo "=================================================="
echo "ПАНЕЛЬ УПРАВЛЕНИЯ    65.109.29.150        2       "
echo "=================================================="

# Menu

PS3='Выберете опцию: '
options=(
"CANTO баланс"
"CANTO собрать все реварды"
"CANTO делегировать в себя"
"CANTO логи"
"CANTO статус"
"CANTO выход из тюрьмы"
"REBUS логи"
"REBUS статус"
"REBUS баланс"
"NYM логи"
"KNSTLD логи"
"KNSTLD статус"
"STRIDE логи"
"STRIDE статус"
"APTOS логи"
"APTOS метрики"
"APTOS ПЕРЕЗАПУСК(Аккуратно!!!)"
"Выход")
select opt in "${options[@]}"
do
case $opt in

"CANTO баланс")
cantod q bank balances canto14hr6ew8jcdhslnxnqj2yz8u8t7lu5tznp3hpfg
break
;;


"CANTO собрать все реварды") 

cantod tx distribution withdraw-all-rewards --from wallet --fees 20000000000000000acanto -y

break
;;

"CANTO делегировать в себя") 

echo "============================================================"
echo "Введите количество:"
echo "============================================================"
read CANTO_AMOUNT
CANTO_AMOUNT=$CANTO_AMOUNT
cantod tx staking delegate cantovaloper14hr6ew8jcdhslnxnqj2yz8u8t7lu5tznr0s9cd ${CANTO_AMOUNT}acanto --from wallet --fees 20000000000000000acanto -y

break
;;



"CANTO логи")

journalctl -u cantod -f -o cat

break
;;

"CANTO статус")

curl localhost:26657/status

break
;;

"CANTO выход из тюрьмы")

cantod tx slashing unjail --from wallet --fees 20000000000000000acanto -y

break
;;

"REBUS логи")

journalctl -u rebusd -f -o cat

break
;;

"REBUS статус")

curl localhost:21657/status

break
;;

"REBUS баланс")

rebusd q bank balances rebus1hcntqnnxshswsyf77j2n8trwzajx3w4c6wlayd

break
;;


"NYM логи")

journalctl -u nym-mixnode -f -o cat

break
;;

"KNSTLD логи")

journalctl -u knstld -f -o cat

break
;;

"KNSTLD статус")

curl localhost:20657/status

break
;;


"STRIDE логи")

journalctl -u strided -f -o cat

break
;;

"STRIDE статус")

curl localhost:16657/status

break
;;

"APTOS логи")

cd .aptos && curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_state_sync_version"

break
;;


"APTOS метрики")

cd .aptos && curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_state_sync_version"

break
;;

"APTOS ПЕРЕЗАПУСК(Аккуратно!!!)")

cd .aptos && docker-compose stop && docker-compose up -d

break
;;

"Выход")
exit
;;
*) echo "Неправильная опция $REPLY";;
esac
done
done
