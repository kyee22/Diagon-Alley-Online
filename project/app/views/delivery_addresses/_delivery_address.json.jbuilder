json.extract! delivery_address, :id, :user_id, :phone, :postal_code, :address, :created_at, :updated_at
json.url delivery_address_url(delivery_address, format: :json)
