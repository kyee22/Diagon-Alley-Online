class CreateDesigns < ActiveRecord::Migration[7.2]
  def change
    create_table :designs do |t|
      t.string :name

      t.timestamps
    end
  end
end
