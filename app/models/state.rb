class State < ActiveRecord::Base
  has_many :addresses

  attr_accessible :abbreviation, :name
end
