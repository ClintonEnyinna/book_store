class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :earnings

      t.timestamps
    end
  end
end
