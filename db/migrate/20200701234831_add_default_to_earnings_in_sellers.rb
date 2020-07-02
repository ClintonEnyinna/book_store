class AddDefaultToEarningsInSellers < ActiveRecord::Migration[5.2]
  def change
    change_column :sellers, :earnings, :integer, default: 0
  end
end
