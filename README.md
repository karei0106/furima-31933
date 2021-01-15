# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email     | string | null: false |
| encrypted_password    | string | null: false |
| nickname | string | null: false |
| name | string | null: false |
| date     | string | null: false |

### Association

- has_many : items
- has_many : purchases
- has_many : shipping_address, through: :purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| explanation   | string | null: false |
| category     | string | null: false |
| state    | string | null: false |
| delivery_fee   | string | null: false |
| shipment_id   | integer | null: false |
| days   | string | null: false |
| price    | integer | null: false |
| user | references | null: false | foreign_key: true | 

### Association

- belongs_to :users
- has_many : purchases
- has_many : shipping_address, through: :purchases

## purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false | foreign_key: true |
| item | references | null: false | foreign_key: true |

### Association

- belongs_to :users
- belongs_to : items
- has_one : shipping address

## shipping_address テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code_id   | integer | null: false |
| prefectures_id   | integer | null: false |
| municipalities     | string | null: false |
| address    | string | null: false |
| phone_number_id   | integer | null: false |
| purchase | references | null: false |foreign_key: true |

### Association

- belongs_to :purchases
- belongs_to : users, through: :purchases
- belongs_to : items, through: :purchases