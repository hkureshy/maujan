class Branch < ActiveRecord::Base
	belongs_to :salon
	has_many :service_categories
	has_many :stylist_categories
	has_many :bookings
end
