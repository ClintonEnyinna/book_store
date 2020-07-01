class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :balance

      t.timestamps
    end
  end
end
