# テーブル設計

## usersテーブル

| Colmun             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :posts
- has_many :comments

## postsテーブル

| Colmun                   | Type           | Option            |
| ------------------------ | -------------- | ----------------- |
| title                    | string         | null: false       |
| text                     | text           | null: false       |
| contents                 | integer        | null: false       |
| meeting_time_id          | integer        | null: false       |
| progress_id              | integer        | null: false       |
| information_id           | integer        | null: false       |
| people_id                | integer        | null: false       |
| user                     | references     | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Colmun           | Type           | Option            |
| ---------------- | -------------- | ----------------- |
| text             | text           |                   |
| evaluation       | float          |                   |
| user             | references     | foreign_key: true |
| post             | references     | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

# アプリケーション名

## MeetingEfficiency

# アプリケーション概要

- 会議後、自分が会議の司会の進行役だった場合などに自己評価を行う。
- 他者からのコメントをもらい、次回行う会議の内容をより良くする。

# 本番環境URL

[MeetingEfficiency](https://meeting-efficiency.herokuapp.com/)

# 制作背景(意図)

- 会議などにかける時間の短縮と、次回からの会議の効率化を図る。
- 会議の反省点を探す

# DEMO
- 投稿画面で必要事項を記入して投稿します。

<img width="500" src="https://i.gyazo.com/fab2cd1b39088b711c59b1cc308d3cb7.png">

- 投稿者は詳細、編集、削除機能が使えます。

<img width="500" src="https://i.gyazo.com/9ee7d0df716175aa5da2d3e2a0684933.png">

- 投稿者以外のログインユーザーはコメントの記入と五段階の星評価ができます。

<img width="500" src="https://i.gyazo.com/352965b12d0970c4dd627b43d66ffce2.png">

# 工夫したポイント
- 投稿画面でのアクティブハッシュで選択した項目を詳細画面で点数化しました。
- コメントでの評価の他に星評価の機能を付けました。

# 使用技術(開発環境)
- Ruby / Ruby on Rails / JavaScript / jQuery / MySQL / GitHub / Heroku / Visual Studio Code / Trello

# 課題や今後実装したい機能
- 誹謗中傷を防ぐためのバリデーション設定
- 星評価の平均点を出す機能

# DB設計
<img width="500" src="https://i.gyazo.com/6da60b28af5374027d73acb1628db96b.png">