class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },format: { with: /\A[0-9]+\z/ }
    
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end
