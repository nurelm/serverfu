class Client < ActiveRecord::Base
  has_many :note, :as => :noteable
  has_many :contact, :as => :contactable
  has_many :site
  belongs_to :server

  attr_accessible :name, :server
end
