#!/bin/bash

while true
do

# Logo

echo "=================================================="
echo "ПАНЕЛЬ УПРАВЛЕНИЯ 152			                        "
echo "=================================================="

# Menu

PS3='Выберете опцию: '
options=(
"CELESTIA логи"
"CELESTIA статус"
"CELESTIA баланс"
"CELESTIA снять вознаграждения"
"CELESTIA делегировать в себя"
"CELESTIA перезапуск и логи"
"HAQQ логи"
"HAQQ статус"
"HAQQ баланс"
"HAQQ снять вознаграждения"
"HAQQ делегировать в себя"
"HAQQ перезапуск и логи"
"Выход")
select opt in "${options[@]}"
do
case $opt in

"CELESTIA логи")

journalctl -fu celestia-appd -o cat

break
;;

"CELESTIA статус")

curl localhost:20657/status

break
;;

"CELESTIA баланс")

celestia-appd q bank balances celestia1qg3cuvj7mtw9q5jmgnqkxyag5jynehee7cp4sj

break
;;

"CELESTIA снять вознаграждения")

  #  journalctl -u nym-mixnode -f -o cat

break
;;

"CELESTIA делегировать в себя")

  #  journalctl -u knstld -f -o cat

break
;;

"CELESTIA перезапуск и логи")

systemctl restart celestia-appd && journalctl -fu celestia-appd -o cat

break
;;

"HAQQ логи")

journalctl -fu haqqd -o cat

break
;;

"HAQQ статус")

curl localhost:26657/status

break
;;

"HAQQ баланс")

haqqd q bank balances haqq1x586dpynqpjpnj3gyr3vgncysrquhdsee90sq6

break
;;

"HAQQ снять вознаграждения")

haqqd tx distribution withdraw-all-rewards --from wallet --fees 500aISLM -y

break
;;

"HAQQ делегировать в себя")

echo "============================================================"
echo "Введите количество:"
echo "============================================================"
read HAQQ_AMOUNT
HAQQ_AMOUNT=$HAQQ_AMOUNT
haqqd tx staking delegate haqqvaloper1x586dpynqpjpnj3gyr3vgncysrquhdse48r7ym ${HAQQ_AMOUNT}aISLM --from wallet --fees 500aISLM -y

break
;;

"HAQQ перезапуск и логи")

systemctl restart haqqd && journalctl -fu haqqd -o cat

break
;;


"Выход")
exit
;;
*) echo "Неправильная опция $REPLY";;
esac
done
done
