class Stylist < ActiveRecord::Base
	belongs_to :stylist_category
  has_many :serv_styls
  has_many :services, through: :serv_styls
end
