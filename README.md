# <MACHIあわせ> 

## サイト概要
### サイトテーマ
<待ち合わせ場所を決めよう>  
遊びに! 仕事に! オフ会に!  
待ち合わせ場所を決めてみんなと合流しよう！  
待ち合わせ場所や時間を忘れてしまってもサイトを開けば簡単に確認できるので安心です。  
遊びの集合場所や仕事の商談の合流場所、ネット上のお友達とのオフ会等にもご利用いただけます。  
町のお店で使えるクーポンも配布しているので待ち合わせでの時間潰しや待ち合わせ後の行き先としてお得に利用しよう！  
遊びなどで使えるコミュニティ＋クーポンサイトです。

### テーマを選んだ理由
元々はバイクのコミュニティサイトでツーリングの合流場所を決める機能を検討していたが逆転の発想で合流場所を選ぶサイトをメインにすればバイクユーザー以外にも気軽に利用してもらえると思ったためです。  
待ち合わせで早く着いた人だと時間潰しにコンビニやカフェを利用する方もいると思うのでクーポンがあるとそのお店を選んでもらいやすくなるでしょう。  
クーポンを配布することにより買い物や遊びに出かけるユーザーを増やす見込みがあると思います。  
クーポンが切っ掛けで出かける人が増えるということは待ち合わせをする人が増え、また待ち合わせがあればどこかのお店に寄る需要があるはずなので待ち合わせとクーポン配布はマッチしていると考えました。  

### ターゲットユーザ
* 友人とよく外に出かけることが多い一般ユーザー
* 仕事などで人と会うことが多いユーザー
* オフ会をすることが多い方
* クーポンを使ってお得に買い物をしたい方

### 主な利用シーン
* 友達を遊びに誘う、仕事相手との商談などで待ち合わせ場所、時間、目的を決める時。
* 場所等を忘れてしまった際の内容の再確認をする時。
* お店のクーポンの配布で待ち合わせの時間潰しをしたい時、またはそれらのお店を目的地にしたい時。
* クーポンを利用してお得に買い物をしたい時。 

## 実装した機能
### ユーザー側実装機能
* ユーザー登録、ログイン・ログアウト、退会が可能
* ユーザー登録なしでログイン可能なゲストログイン機能搭載
* マイページ（ユーザー情報変更、ユーザー画像登録、待ち合わせ投稿閲覧、いいねしたクーポン一覧、参加した待ち合わせ一覧）
* 待ち合わせ閲覧（地図の表示、編集&削除（自分の投稿のみ）、参加機能、コメント投稿&削除）
* 待ち合わせ投稿
* クーポン閲覧画面（いいね機能）
* ユーザー、待ち合わせ、クーポン検索機能

### 管理者側実装機能
* 管理者ログイン・ログアウト<br>
  管理者ログインに必要な情報<br>
  メールアドレス：admin@admin.com<br>
  パスワード:test2022
* ユーザー情報変更（有効、退会切り替え可能）
* 待ち合わせ閲覧画面（地図の表示、編集&削除、コメント削除）
* 待ち合わせ編集
* クーポン投稿
＊ クーポン編集&削除
＊ ユーザー、待ち合わせ、クーポン検索機能


## 設計書

## 実装機能リストのURL
https://docs.google.com/spreadsheets/d/1b3bCtay2DQlPb4nRGDhxaVza3rLRDQgO-rtdSEhpBsQ/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- 外部API：Google Maps API

## 使用素材
Font Awesome https://fontawesome.com/
