class StylistCategory < ActiveRecord::Base
	belongs_to :branch
	has_many :stylists
	has_many :service_stylists
	has_many :service_categories, :through => :service_stylists
end
