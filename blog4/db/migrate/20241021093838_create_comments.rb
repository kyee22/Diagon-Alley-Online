class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :blog, null: false, foreign_key: true
      t.text :contont

      t.timestamps
    end
  end
end