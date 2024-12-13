class AddReceiverNameToDeliveryAddresses < ActiveRecord::Migration[7.2]
  def change
    add_column :delivery_addresses, :receiver_name, :string
  end
end
