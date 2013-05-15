class Email < ActiveRecord::Base
  belongs_to :contact

  attr_accessible :contact, :description, :email
end
