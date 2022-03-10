Ruby on Rails サンプル実装
====================


前提条件
--------------------

* docker, docker-composeがインストールされていること
* bashが利用できること
* makeが利用できること


環境
--------------------

* bash(on WSL2)
* docker, docker-compose

### 実行環境情報

* ruby: 3.1.1p18
* rails: 7.0.2.3
* node: v12.22.5
* yarn: 1.22.17
* mysql: 8.0.16

### dockerコンテナ

| コンテナ |             用途              |
| -------- | :---------------------------- |
| app      | laravel実行                   |
| db       | データベース                  |
| adminer  | DBツール(WebGUI)              |

### 機能

* ツール

|   機能    |          URL           |
| --------- | ---------------------- |
| DB GUI    | http://localhost:8080/ |

* アプリケーション

| 機能 |          URL           |
| ---- | ---------------------- |
| Top  | http://localhost:3000/ |


構築
----------

### 管理者向け

プロジェクトの初期構築手順は以下を参照
* [初期構築](./doc/init-project.md)

### 開発者向け

リポジトリをclone後, makeコマンドにて環境構築してください

```bash
# リポジトリ clone
git clone [リポジトリURL]

# 初期構築
#  - docker container build
make init
```

Tips
----------

### Makeコマンド

```bash
bash                 Exec bash in php container
build                Build docker containers
destroy-all          Exec docker compose down(remove volumes and images)
destroy              Exec docker compose down(remove volumes)
down                 Exec docker compose down
help                 Show help
init                 Setup environment for develop(build containers and startup containers)
mysql                Exec mysql cli in mysql container
ps                   Exec docker compose ps
up                   Exec docker compose up(background)
```
