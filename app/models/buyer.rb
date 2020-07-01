class Buyer < ApplicationRecord
  has_many :orders
  has_many :books, through: :orders
end
