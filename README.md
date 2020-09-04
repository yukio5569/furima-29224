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
- has_many :shippingaddresss

## items テーブル

| Column          | Type    | Options     |
| ----------------| ------- | ----------- |
| user_id         | string  | null: false |
| name            | string  | null: false |
| image           | string  | null: false |
| explanation     | text    | null: false |
| price           | integer | null: false |
| category_id     | integer | null: false |
| status_id       | integer | null: false |
| delivery fee_id | integer | null: false |
| prefectures_id  | integer | null: false |
| days_id         | integer | null: false |

### Association

- belongs_to :user
- belongs_to :buyer
- has_many: shippingaddresss

## buyers テーブル

| Column                | Type    | Options     |
| ----------------------| ------- | ----------- |
| postal code           | string  | null: false |
| prefectures_id        | integer | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| building name         | string  |             |
| phone number          | string  | null: true  |

### Association

- belongs_to :user
- has_many :items
- has_one :shippingaddress

## shippingaddresss テーブル

| Column   | Type    | Options     |
| ---------| ------- | ----------- |
| user_id  | integer | null: false |
| item_id  | integer | null: false |
| buyer_id | integer | null: false |


### Association

- belongs_to :user
- berongs_to :items
- belongs_to :buyer

