class Site < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :domains
  has_many :credentials
  belongs_to :client
  belongs_to :ip
end
