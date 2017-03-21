class Salon < ActiveRecord::Base
	has_many :branches
	mount_uploader :salon_img, SalonImageUploader
end
