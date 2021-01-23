class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  with_options presence: true do
  validates :nickname
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
  validates :first_name
  validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/ } do
  validates :first_name_ruby
  validates :last_name_ruby
  end
  
  validates :birthday
 end
end
