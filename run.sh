#!/bin/sh

echo "Craftopia Dedicated Server(安定版)の最新バージョンにアップデートします"
/usr/games/steamcmd +login anonymous +app_update 1670340 +quit

echo "Craftopia Dedicated Serverを起動します"
echo "Log: /var/log/craftopia/`date "+%Y%m%d_%H%M%S"`.log"

# サーバーを起動してログを/var/log/craftopia/日付.logに書き込む
".steam/steamapps/common/CraftopiaDedicatedServer/Craftopia.x86_64" > /var/log/craftopia/`date "+%Y%m%d_%H%M%S"`.log

echo "Craftopia Dedicated Serverが停止されました"

sleep 600
