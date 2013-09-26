class Contact < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
  has_many :addresses
  has_many :emails
  has_many :phones
end
