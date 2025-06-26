---
marp: true
theme: custom
---


<!--
headingDivider: 1
-->

# 目次
- Dockerfileの書き方とレイヤーについて
- Docker Composeの使い方とYAMLファイルの書き方
- docker compose upについて
- docker execについて
- docker rmについて
- docker rmiについて
- docker compose downについて

# Dockerfileの書き方とレイヤーについて

# Dockerfileとは
Dockerfileは、Dockerイメージを作成するための設定ファイル。
「どんなソフトウェア環境を、どのような手順で作るか」を一行ずつ命令する。

# 実際のDockerfileを見てみよう

# レイヤーについて
Dockerfileの各命令（FROM, RUN, **ENVなど）は「レイヤー」と呼ばれる単位でイメージに積み重なっていく。

---

レイヤーのおかげで、途中まで同じ内容ならキャッシュが効いてビルドが速くなり、ストレージの節約や変更の追跡も容易になる。

# Docker Composeの使い方とYAMLファイルの書き方

# Docker Composeとは
複数のDockerコンテナを一括で管理するためのツール。
YAMLファイル(docker-compose.yml)を使って、サービスの定義や設定を行う。

# 実際のdocker-compose.ymlを見てみよう

# docker compose upについて

# docker compose upとは
docker-compose.ymlに定義されたすべてのサービスを起動するコマンド


# docker compose upの主なオプション
- `-d` : バックグラウンドで実行
- `--build` : イメージを再ビルドしてから起動(あとで説明します)

-dと--buildを組み合わせて使う例
```bash
docker compose up -d --build
```

特定のサービスだけ起動することも可能
```bash
docker compose up mysql
```

# docker compose upを実行してみよう
---
## 実行するコマンド
```bash
docker compose up
```
or
```bash
docker compose up -d
```

# docker compose up —buildについて

# docker compose up —buildとは
Dockerイメージを再構築（ビルド）してからコンテナを起動するコマンド

    
# docker execについて

# docker execとは
実行中のDockerコンテナ内で新しいコマンドを実行するためのコマンド


- すでに起動しているコンテナに対して、外部からコマンドを追加で実行
- コンテナの中に入って設定の確認や変更を行うことができる
- シェルを起動して、コンテナ内で直接操作することも可能


# 基本的な使い方
```bash
docker exec [オプション] コンテナ名（またはID） コマンド [引数...]
```

# docker execの主なオプション
- `-i` : 標準入力をオープンにする
- `-t` : 仮想端末を割り当てる（シェルを使う場合に必要）

# 実際にdocker execを使ってみよう

---
<!--
_header: 'docker execについて'
paginate: true
-->

## 実行するコマンド
```bash
docker exec -it mysql-container /bin/bash
```

コマンドの意味
- `-it` : インタラクティブな端末を割り当て
- `mysql-container` : 対象のコンテナ名
- `/bin/bash` : コンテナ内でBashシェルを起動

# docker rmについて

# docker rmとは
Dockerコンテナを削除するためのコマンド
停止したコンテナを削除することによってシステム上の不要なリソースを整理できる

# 基本的な使い方
```bash
docker rm [オプション] コンテナ名（またはID）
```

# docker rmの主なオプション
- `-f` : 強制的にコンテナを削除（実行中のコンテナも削除）
- `-v` : コンテナに関連するボリュームも削除

# 実際にdocker rmを使ってみよう
--- 

## 実行するコマンド
```bash
docker rm mysql-container
```
※このコマンドは、停止しているコンテナを削除するためのものです。
コンテナを停止するためには
```bash
docker stop mysql-container
```
を先に実行する必要があります。


# docker rmiについて

# docker rmiとは
ローカル環境に保存されているDockerイメージを削除するコマンド

# 基本的な使い方
```bash
docker rmi [オプション] イメージ名（またはID）
```

# docker rmiの主なオプション
- `-f` : 強制的にイメージを削除（他のコンテナが使用中でも削除）

# 実際にdocker rmiを使ってみよう
---
## 実行するコマンド
```bash
docker rmi {イメージID}
```


# docker compose downについて

# docker compose downとは
docker-compose.ymlファイルで定義された下記を全て削除するコマンド
- コンテナ
- ネットワーク
- ボリューム（オプションで指定した場合）

# 基本的な使い方
```bash
docker compose down [オプション]
```

# docker compose downの主なオプション
- `-v` : ボリュームも削除
- `--rmi` : イメージも削除（`all`または`local`を指定）

# お疲れ様でした！