# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| id               | strnig | null: false | 
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family name      | string | null: false |
| last name        | string | null: false |
| family name kana | string | null: false |
| last name kana   | string | null: false |
| birthyear        | string | null: false |
| birthmonth       | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_one : buyer

## item テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| id           | strnig  | null: false | 
| name         | string  | null: false |
| image        | string  | null: false |
| explanation  | text    | null: false |
| price        | integer | null: false |

### Association

- belongs_to :user
- belongs_to :buyer

## buyer テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| id                    | strnig | null: false | 
| cardinformation       | string | null: false |
| expiration date month | string | null: false |
| expiration date year  | string | null: false |
| security code         | string | null: false |
| postal code           | string | null: false |
| city                  | string | null: false |
| address               | string | null: false |
| building name         | string | null: true  |
| phone number          | string | null: true  |

### Association

- belongs_to :user
- has_many :items

