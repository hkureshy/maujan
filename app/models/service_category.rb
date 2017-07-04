class ServiceCategory < ActiveRecord::Base
	belongs_to :branch
	has_many :services
	has_many :service_stylists
	has_many :stylist_categories, :through => :service_stylists
	has_many :stylists, through: :stylist_categories
end
