# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_one : buyer
- has_many :shippingaddresss

## items テーブル

| Column          | Type    | Options           |
| ----------------| ------- | ----------------- |
| user_id         | integer | foreign_key: true |
| name            | string  | null: false       |
| explanation     | text    | null: false       |
| price           | integer | null: false       |
| category_id     | integer | null: false       |
| status_id       | integer | null: false       |
| delivery_fee_id | integer | null: false       |
| prefectures_id  | integer | null: false       |
| days_id         | integer | null: false       |

### Association

- belongs_to :user
- belongs_to :buyer
- has_one: shippingaddresss

## buyers テーブル

| Column   | Type    | Options           |
| ---------| ------- | ----------------- |
| user_id  | integer | foreign_key: true |
| item_id  | integer | foreign_key: true |


### Association

- belongs_to :user
- has_many :items
- has_one :shippingaddress

## shippingaddresss テーブル

| Column                | Type    | Options           |
| ----------------------| ------- | ----------------- |
| item_id               | integer | foreign_key: true |
| buyer_id              | integer | foreign_key: true |
| postal_code           | string  | null: false       |
| prefectures_id        | integer | null: false       |
| city                  | string  | null: false       |
| address               | string  | null: false       |
| building_name         | string  |                   |
| phone_number          | string  | null: true        |



### Association

- belongs_to :user
- berongs_to :items
- belongs_to :buyer