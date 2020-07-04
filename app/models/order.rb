class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :book

  after_create_commit do
    OrderBroadcastJob.perform_later(book_id)
  end

  before_destroy do
    DeleteOrderBroadcastJob.perform_later(self)
  end
end
