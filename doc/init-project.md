プロジェクト初期設定
====================


プロジェクト作成
--------------------

rubyコンテナを個別で起動して作成

```bash
# コンテナ起動
docker run --rm -it -v $(pwd)/apps:/src -w /src -u ruby ruby/app bash

# railsインストール
gem install rails -v '7.0.2.3'

# プロジェクト作成
rails new admin -d mysql -j esbuild --css tailwind 
```

* データベース設定
    - admin/config/database.yml


ログインユーザ機能作成
--------------------

* Gemfileに以下を追加

```
# 暗号化
gem 'bcrypt'
```

* bundle install

```bash
bundle install
```

* scaffold

```bash
make bash

# コンテナ内でscaffoldを実行
rails g scaffold User name:string email:string password_digest:string

# migration
rails db:migrate
```
