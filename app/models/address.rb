class Address < ActiveRecord::Base
  belongs_to :contact
  belongs_to :state

  attr_accessible :city, :description, :state, :street1, :street2, :zip
end
