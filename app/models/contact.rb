class Contact < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
  has_many :addresses
  has_many :emails
  has_many :phones

  attr_accessible :description, :first_name, :last_name, :middle_name
end
