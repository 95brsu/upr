#!/bin/bash

while true
do

# Logo

echo "=================================================="
echo "ПАНЕЛЬ УПРАВЛЕНИЯ 65.109.29.150                   "
echo "=================================================="

# Menu

PS3='Выберете опцию: '
options=(
"Проверить логи Canto"
"Проверить логи Rebus"
"Проверить баланс Rebus"
"Проверить логи NYM"
"Проверить логи KNSTLD"
"Проверить логи STRIDE"
"Подключиться у 150"
"Подключиться у 153"
"Выход")
select opt in "${options[@]}"
do
case $opt in

"Проверить логи Canto")

journalctl -u cantod -f -o cat

break
;;

"Проверить логи Rebus")

journalctl -u rebusd -f -o cat

break
;;

"Проверить баланс Rebus")

rebusd q bank balances rebus1hcntqnnxshswsyf77j2n8trwzajx3w4c6wlayd

break
;;



"Проверить логи NYM")

journalctl -u nym-mixnode -f -o cat

break
;;

"Проверить логи KNSTLD")

journalctl -u knstld -f -o cat

break
;;

"Проверить логи STRIDE")

journalctl -u strided -f -o cat

break
;;

"Подключиться у 150")

ssh rootil@10.0.2.17

break
;;

"Выход")
exit
;;
*) echo "Неправильная опция $REPLY";;
esac
done
done
