# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email     | string | null: false |
| encrypted_password    | string | null: false |
| nickname | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_ruby | string | null: false |
| last_name_ruby | string | null: false |
| birthday     | date | null: false |

### Association

- has_many : items
- has_many : order

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| explanation   | text | null: false |
| category_id     | integer | null: false |
| state_id    | integer | null: false |
| delivery_fee_id   | integer | null: false |
| prefecture_id   | integer | null: false |
| day_id   | integer | null: false |
| price    | integer | null: false |
| user | references | null: false , foreign_key: true | 

### Association

- belongs_to : user
- has_one : order

## order テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false , foreign_key: true |
| item | references | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to : item
- has_one : shipping_address

## shipping_address テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture_id   | integer | null: false |
| municipalities     | string | null: false |
| address    | string | null: false |
| phone_number   | string | null: false |
| building   | string |
| order | references | null: false , foreign_key: true |

### Association

- belongs_to : order