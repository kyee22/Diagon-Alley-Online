class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery_address, null: false, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
