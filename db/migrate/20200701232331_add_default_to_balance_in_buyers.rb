class AddDefaultToBalanceInBuyers < ActiveRecord::Migration[5.2]
  def change
    change_column :buyers, :balance, :integer, default: true
  end
end
