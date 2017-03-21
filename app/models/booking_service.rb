class BookingService < ActiveRecord::Base
	belongs_to :booking
	belongs_to :service
end
