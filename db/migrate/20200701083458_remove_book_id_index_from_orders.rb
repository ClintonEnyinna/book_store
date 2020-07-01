class RemoveBookIdIndexFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_index :orders, :book_id
  end
end
