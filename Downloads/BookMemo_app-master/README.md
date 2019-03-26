# README

# BookMemo_appは読んだ本のメモの保存・管理ができるサービスです。
BookMemo_appは公開設定にすることで「みんなの読書メモ」でログインしていない人も閲覧することができます。

＃　BookMemo_appは以下のURLで見ることができます。

https://bookmemoapp.herokuapp.com/

＃　また、このアプリケーションをローカルで動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドをターミナル(Windowsはコマンドプロンプト)で打ち、RubyGemsをインストールします。

$ bundle install --without production

次に、データベースへのマイグレーションを実行してください。

$ rails db:migrate

次に、Railsサーバーを立ち上げてください

$ rails server


* Ruby バージョン
　ruby 2.5.0p0

* Rails バージョン
　Rails 5.2.2

* データベース
　postgresql

* サーバー
　heroku/7.19.4 darwin-x64 node-v11.3.0

