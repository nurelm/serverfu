class Host < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :contacts, :as => :contactable
  has_many :servers
end
