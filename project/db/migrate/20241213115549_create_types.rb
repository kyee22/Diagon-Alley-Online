class CreateTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :rarity

      t.timestamps
    end
  end
end
