class Seller < ApplicationRecord
  has_many :registered_books, foreign_key: 'seller_id', class_name: 'Book', dependent: :destroy

  validates :name, :email, :phone, presence: true
  validates :earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  validate :unique_email

  def unique_email
    errors.add(:email, 'is already taken') if Buyer.where(email: email).exists?
  end
end
