class Seller < ApplicationRecord
  has_many :registered_books, foreign_key: 'seller_id', class_name: 'Book', dependent: :destroy

  validates :name, :email, :phone, presence: true
  validates :earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
