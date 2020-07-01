class Book < ApplicationRecord
  has_one :order, dependent: :destroy
  has_one :buyer, through: :order
  belongs_to :seller

  
end
