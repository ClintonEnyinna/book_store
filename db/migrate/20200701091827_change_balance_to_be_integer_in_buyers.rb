class ChangeBalanceToBeIntegerInBuyers < ActiveRecord::Migration[5.2]
  def change
    change_column :buyers, :balance, :integer
  end
end
