class AddColorRefToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :color, null: false, foreign_key: true
  end
end
