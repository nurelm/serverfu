class Ip < ActiveRecord::Base
  has_many :sites
  belongs_to :server
end
