class Seller < ApplicationRecord
  has_many :registered_books, foreign_key: 'seller_id', class_name: "Book"
end
