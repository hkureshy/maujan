json.extract! booking, :id, :branch_id, :area, :city, :service_name, :count, :price, :total_amount, :booking_date, :booking_time, :created_at, :updated_at
json.url booking_url(booking, format: :json)