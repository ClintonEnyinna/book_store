class Buyer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :books, through: :orders
end
