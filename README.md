# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family name      | string | null: false |
| last name        | string | null: false |
| family name kana | string | null: false |
| last name kana   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_one : buyer

## item テーブル

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| item name          | string  | null: false |
| image              | string  | null: false |
| explanation        | text    | null: false |
| price              | integer | null: false |
| item details       | string  | null: false |
| regarding delivery | integer | null: false |

### Association

- belongs_to :user
- belongs_to :buyer

## buyer テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| expiration date month | string | null: false |
| expiration date year  | string | null: false |
| security code         | string | null: false |
| postal code           | string | null: false |
| city                  | string | null: false |
| address               | string | null: false |
| building name         | string |             |
| phone number          | string | null: true  |

### Association

- belongs_to :user
- has_many :items


