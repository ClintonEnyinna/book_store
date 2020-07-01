class AddSellerToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :seller, index: true, foreign_key: true
  end
end
