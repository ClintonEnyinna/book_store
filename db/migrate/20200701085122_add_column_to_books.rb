class AddColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sold, :boolean, default: false, null: false
  end
end
