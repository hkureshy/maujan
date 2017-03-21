json.extract! service, :id, :branch_id, :service_name, :price, :created_at, :updated_at
json.url service_url(service, format: :json)