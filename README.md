# docker-craftopia

CraftopiaのLinux版専用サーバーのDockerImageです。

起動時に自動でSteamから最新バージョンがダウンロードされます。

ログは/var/log/craftopia/日付.logに書き込まれます。

2021年10月現在はα edge版のみ対応しています。

# 使い方

## 起動方法

最新バージョンのα版サーバー起動したい場合のコマンド
```
docker run --detach -p 6587:6587/udp --name craftopia_server -it docker-craftopia:latest
```

！**準備中**につきまだ使用できません！

最新バージョンの安定版サーバーを起動したい場合のコマンド
```
docker run --detach -p 6587:6587/udp --name craftopia_server -it docker-craftopia:stable
```

## 停止方法
```
docker stop craftopia_server
docker rm craftopia_server 
```

## 設定ファイルの場所
上記のコマンドで実行した場合は、ホストマシンの./Craftopiaに保存され同期されます。

# 開発者向け

以下のコマンドは開発者向けなので、サーバーを建てたい人は実行する必要はありません。

コンテナイメージをビルドする
```
docker build -t docker-craftopia .
```

ビルドしたコンテナイメージを実行する
```
docker run -p 6587:6587/udp --name craftopia_server -it docker-craftopia:latest
```

## TODO
[ ] 開始時自動アップデート対応

[ ] configのボリュームマウント

[ ] docker composeサンプル対応

[ ] 起動中自動アップデート対応
