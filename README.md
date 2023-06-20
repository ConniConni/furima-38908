# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nikcname           | string              | null: false               |
| email              | string              | null: false               |
| encrypted_password | string              | null: false, unique: true |
| firstname          | text                | null: false               |
| lastname           | text                | null: false               |
| birthday           | text                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| product             | string     | null: false                    |
| category            | text       | null: false                    |
| price               | text       | null: false                    |
| seller              | text       | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| buyer      | string     | null: false                    |
| adress     | string     | null: false                    |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user