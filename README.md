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
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_id          | integer    | null: false                    |
| prefecure_id        | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## destinations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

