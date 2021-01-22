class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :first_name_ruby, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :last_name_ruby, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday, presence: true
end