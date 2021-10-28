# Ubuntuの安定版をベースイメージに使用します
FROM ubuntu:20.04

# 現在はα edgeのみLinux版専用サーバーを提供しています
ARG VERSION=alpha-unstable-edge
ARG UPDATE=autoupdate

# ユーザー情報
ARG USERNAME=craftopia
ARG GROUPNAME=craftopia
ARG UID=1000
ARG GID=1000

# SteamCMDをインストールする
RUN apt-get -y update; \
    apt-get install -y software-properties-common; \
    add-apt-repository multiverse; \
    dpkg --add-architecture i386; \
    apt update -y 

RUN apt-get install -y lib32gcc1
RUN echo "I AGREE" | apt-get install -y steamcmd

RUN mkdir /var/log/craftopia

# 実行用ShellScriptの追加
ADD run.sh /
ADD entrypoint.sh /
RUN chmod +x run.sh
RUN chmod +x entrypoint.sh

# rootで実行するのは危険なので、Craftopia用のユーザーを作成します
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
RUN chown $USERNAME /var/log/craftopia

USER $USERNAME
WORKDIR /home/$USERNAME/

# Craftopiaをインストールして検証します
RUN /usr/games/steamcmd +login anonymous +app_update 1670340 -beta $VERSION validate +quit

# run時に実行するコマンド　サーバーを起動してログを/var/log/craftopia/日付.logに書き込みます
CMD /run.sh $UPDATE $VERSION

# デフォルトの公開ポート　ポートの変更はDockerのポートフォワーディングで変更することを推奨します
EXPOSE 6587/udp
