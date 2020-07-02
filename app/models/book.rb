class Book < ApplicationRecord
  has_one :order, dependent: :destroy
  has_one :buyer, through: :order
  belongs_to :seller

  validates :title, :description, :author, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
