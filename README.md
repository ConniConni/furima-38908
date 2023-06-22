# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false,              |
| firstname          | string              | null: false               |
| lastname           | string              | null: false               |
| firstname_kana     | string              | null: false               |
| lastname_kana      | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| title               | string     | null: false                    |
| price               | integer    | null: false                    |
| explanation         | text       | null: false                    |
| genre               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders
- belong_to :product

## orders table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## destinations table

| Column           | Type       | Options                                             |
|------------------|------------|--------------------------------                     |
| post_code        | string     | null: false, limit: 8, pattern: '/\A\d{3}-\d{4}\z/' |
| prefectures      | string     | null: false                                         |
| municipality     | string     | null: false                                         |
| address          | string     | null: false                                         |
| building         | string     |                                                     |
| telephone_number | string     | null: false, limit: 11, pattern: '/\A\d{10,11}\z/'  |
| order            | references | null: false, foreign_key: true                      |

### Association

- belongs_to :order

## products table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| postage          | string     | null: false                    |
| municipality     | string     | null: false                    |
| prefecures       | string     | null: false                    |
| delivery_date    | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :order