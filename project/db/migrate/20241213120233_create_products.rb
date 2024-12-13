class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :sales, default: 0  # 设置默认值为 0

      t.timestamps
    end
  end
end
