class Buyer < ApplicationRecord
  after_create :update_balance

  has_many :orders, dependent: :destroy
  has_many :books, through: :orders

  validates :name, :email, :address, presence: true
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  validate :unique_email

  def unique_email
    errors.add(:email, 'is already taken') if Seller.where(email: email).exists?
  end

  def update_balance
    signup_bonus = 50
    update(balance: signup_bonus)
  end
end
