class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id , :municipality, :address, :building, :telephone_number, :item_id, :user_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with:/\A\d{10,11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end