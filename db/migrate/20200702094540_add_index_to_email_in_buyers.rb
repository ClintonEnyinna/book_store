class AddIndexToEmailInBuyers < ActiveRecord::Migration[5.2]
  def change
    add_index :buyers, :email, unique: true
  end
end
