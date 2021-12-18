# docker-craftopia

CraftopiaのLinux版専用サーバーのDockerImageです。

起動時に自動でSteamから最新バージョンがダウンロードされます。

ログは/var/log/craftopia/日付.logに書き込まれます。

現在はα(alpha-unstable)のみ対応しています。

**イメージ配布先**

https://github.com/users/ChujoHiroto/packages/container/package/docker-craftopia

# 使い方

## 起動方法

最新バージョンのサーバーを起動したい場合のコマンド
```
docker run --detach -v config/craftopia-server:/home/craftopia/.config/unity3d/PocketPair -p 6587:6587/udp --name craftopia-server -it ghcr.io/chujohiroto/docker-craftopia:latest
```

最新バージョンのα版サーバー起動したい場合のコマンド
```
docker run --detach -v "craftopia-server:/home/craftopia/.config/unity3d/PocketPair" -p 6587:6587/udp --name craftopia-server -it ghcr.io/chujohiroto/docker-craftopia:alpha
```

## 停止、および削除方法
```
docker stop craftopia-server
docker rm craftopia-server 
```

## 設定ファイル、セーブデータの場所
上記のコマンドで実行した場合は、ホストマシンの./Craftopiaに保存され同期されます。

# 開発者向け

以下のコマンドは開発者向けなので、サーバーを建てたい人は実行する必要はありません。

コンテナイメージをビルドする
```
docker build -t docker-craftopia .
```

ビルドしたコンテナイメージを実行する
```
docker run -p 6587:6587/udp --name craftopia-server -it docker-craftopia:latest
```

## TODO
[x] 開始時自動アップデート対応

[x] configのボリュームマウント

[x] docker composeサンプル対応

[ ] 起動中自動アップデート対応

[ ] BeplnExイメージの頒布
