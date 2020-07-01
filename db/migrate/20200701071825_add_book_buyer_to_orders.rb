class AddBookBuyerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :book, index: true, foreign_key: true
    add_reference :orders, :buyer, index: true, foreign_key: true
  end
end
