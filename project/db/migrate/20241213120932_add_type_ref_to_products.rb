class AddTypeRefToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :type, null: false, foreign_key: true
  end
end
