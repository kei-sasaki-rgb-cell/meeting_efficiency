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