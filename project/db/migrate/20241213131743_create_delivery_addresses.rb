class CreateDeliveryAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :phone
      t.string :postal_code
      t.text :address

      t.timestamps
    end
  end
end
