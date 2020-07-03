class CreateAppEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :app_earnings do |t|
      t.integer :singleton_guard
      t.integer :earnings, default: 0

      t.timestamps
    end
    add_index :app_earnings, :singleton_guard, unique: true
  end
end
