class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :book
end
