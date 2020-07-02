class AddIndexToEmailInSellers < ActiveRecord::Migration[5.2]
  def change
    add_index :sellers, :email, unique: true
  end
end
