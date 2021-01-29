class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_one : purchase

  with_options presence: true do
    validates :title
    validates :explanation
    VALID_PASSWORD_REGEX = /\A[0-9]+\z/i.freeze
    validates :price, format: { with: VALID_PASSWORD_REGEX },
    numericality: { only_integer: true,

      greater_than: 300, less_than: 10000000
      
      }
    validates :image
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end
end
