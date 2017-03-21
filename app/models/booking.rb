class Booking < ActiveRecord::Base
	has_many :booking_services
	has_many :services, :through => :booking_services
	belongs_to :customer
end
