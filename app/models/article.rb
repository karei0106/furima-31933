class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  # 空の投稿を保存できないようにする
  validates :title, :explanation, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :day_id, :price, :image,
            presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 0 }
end
