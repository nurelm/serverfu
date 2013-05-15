class Ip < ActiveRecord::Base
  has_many :sites
  belongs_to :server

  attr_accessible :address
end
