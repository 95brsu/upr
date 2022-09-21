#!/bin/bash

while true
do

# Logo

echo "=================================================="
echo "ПАНЕЛЬ УПРАВЛЕНИЯ    APTOS           RANGE     1  "
echo "=================================================="

# Menu

PS3='Выберете опцию: '
options=(
"APTOS validator логи"
"APTOS full-node логи"
"APTOS метрики"
"APTOS пропозлы"
"APTOS ПЕРЕЗАПУСК(Аккуратно!!!)"
"Выход")
select opt in "${options[@]}"
do
case $opt in

"APTOS validator логи"

cd .aptos && docker logs -f --tail 100 aptos-validator-1

break
;;

"APTOS full-node логи"

cd .aptos && docker logs -f --tail 100 aptos-fullnode-1

break
;;


"APTOS метрики")

cd .aptos && curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_state_sync_version"

break
;;

"APTOS пропозлы")

cd .aptos && curl 127.0.0.1:9101/metrics 2> /dev/null | grep "aptos_consensus_proposals_count"

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
