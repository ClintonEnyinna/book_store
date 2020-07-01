class AddUniquenessToBookIdInOrders < ActiveRecord::Migration[5.2]
  def change
    add_index :orders, :book_id, unique: true
  end
end
