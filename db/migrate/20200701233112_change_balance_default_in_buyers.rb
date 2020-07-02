class ChangeBalanceDefaultInBuyers < ActiveRecord::Migration[5.2]
  def change
    change_column :buyers, :balance, :integer, default: 0
  end
end
