json.extract! customer, :id, :booking_id, :name, :email, :phone_no, :created_at, :updated_at
json.url customer_url(customer, format: :json)