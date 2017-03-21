class ServiceStylist < ActiveRecord::Base
	belongs_to :stylist_category
	belongs_to :service_category
end
