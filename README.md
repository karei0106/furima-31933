# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email     | string | null: false |
| password    | string | null: false |
| nickname | string | null: false |
| birthday     | string | null: false |

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| category     | string | null: false |
| state    | string | null: false |
| price    | string | null: false |
| user | references | null: false |

## purchases テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false |
| item | references | null: false |

## shipping address テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal code   | string | null: false |
| prefectures   | string | null: false |
| municipalities     | string | null: false |
| address    | string | null: false |
| phone number    | string | null: false |
| user | references | null: false |
| item | references | null: false |
| purchase | references | null: false |