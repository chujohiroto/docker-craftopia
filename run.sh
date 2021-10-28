#!/bin/sh
# $1 = autoupdate
# $2 = VERSION

# echo "Craftopia Dedicated Server($2)の最新バージョンにアップデートします"
# /usr/games/steamcmd +login anonymous +app_update 1670340 -beta "$2" validate +quit

echo "Craftopia Dedicated Serverを起動します"
echo "Log: /var/log/craftopia/`date "+%Y%m%d_%H%M%S"`.log"

# サーバーを起動してログを/var/log/craftopia/日付.logに書き込む
".steam/steamapps/common/Craftopia Dedicated Server/Craftopia.x86_64" > /var/log/craftopia/`date "+%Y%m%d_%H%M%S"`.log

echo "Craftopia Dedicated Serverが停止されました"

sleep 600
