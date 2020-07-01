class Book < ApplicationRecord
  has_one :order
  has_one :buyer, through: :order
  belongs_to :seller
end
