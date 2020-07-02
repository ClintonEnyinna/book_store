class Buyer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :books, through: :orders

  validates :name, :email, :address, presence: true
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
