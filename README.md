# テーブル設計

## Users テーブル

| Column             | Type   |Options                  |
|--------------------|--------|-------------------------|
| nickname           | string | null: false             |
| email              | string | null: false             |
| encrypted_password | string | null: false             |

### Association
 - has_many :events
 - has_many :entries

## Events テーブル

| Column             | Type       |Options                        |
|--------------------|------------|-------------------------------|
| event              | string     | null: false                   |
| category           | string     | null: false                   |
| date               | integer    | null: false                   |
| prefectures        | integer    | null: false                   |
| venue              | string     | null: false                   |
| fee                | integer    | null: false                   |
| deadline           | integer    | null: false                   |
| explanation        | text       | null: false                   |
| user               | references | null: false, foreign_key: true|

## Association
 - has_many :entries
 - belongs_to :user

## Entries テーブル
| Column             | Type       |Options                        |
|--------------------|------------|-------------------------------|
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kata     | string     | null: false                   |
| first_name_kata    | string     | null: false                   |
| postal_code        | string     | null: false                   |
| address            | string     | null: false                   |
| phone              | integer    | null: false                   |
| group              | string     |                               |
| record             | string     |                               |
| user               | references | null: false, foreign_key: true|
| event              | references | null: false, foreign_key: true|
#### イベントがダブルスだった場合以下も含む
| last_name2         | string     | null: false                   |
| first_name2        | string     | null: false                   |
| last_name_kata2    | string     | null: false                   |
| first_name_kata2   | string     | null: false                   |
| postal_code2       | string     | null: false                   |
| address2           | string     | null: false                   |
| phone2             | integer    | null: false                   |
| group2             | string     |                               |
| record2            | string     |                               |

## Association
 - belongs_to :user
 - belongs_to :event


