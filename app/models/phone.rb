class Phone < ActiveRecord::Base
  belongs_to :contact

  attr_accessible :description, :phone
end
