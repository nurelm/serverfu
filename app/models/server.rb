class Server < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :clients
  belongs_to :host

  attr_accessible :host, :name
end
