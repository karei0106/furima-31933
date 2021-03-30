class OrderAddress
  include ActiveModel::Model
  attr_accessor :image, :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0 }
  VALID_PASSWORD_REGEX = /\A[0-9]+\z/i.freeze

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                           address: address, building: building, order_id: order.id)
  end
end
