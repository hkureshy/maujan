class ServStyl < ActiveRecord::Base
  belongs_to :service
  belongs_to :stylist
end
