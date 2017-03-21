class Service < ActiveRecord::Base
#	attr_accessible :salon_id, :branch_id, :service_category_id, :service_name, :price, :discount
  require 'roo'

	belongs_to :service_category
	has_many :discounts
	has_many :booking_services
	has_many :bookings, :through => :booking_services

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			product = find_by_id(row["id"]) || new
			product.attributes = row.to_hash.slice#(*accessible_attributes)
			product.save!
		end
	end

	def discount_price
		if self.discount > 0
			dis = (self.discount/100) * self.price
			dis_price = self.price - dis
		else
			dis_price = self.price
		end
		return dis_price
	end

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Roo::CSV.new(file.path)#, nil, :ignore)
		when ".xls" then Excel.new(file.path, nil, :ignore)
		when ".xlsx" then Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end
end
