class CreateColors < ActiveRecord::Migration[7.2]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :code
      t.decimal :opacity

      t.timestamps
    end
  end
end
