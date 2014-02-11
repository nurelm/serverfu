class Client < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :contacts, :as => :contactable
  has_many :sites
  belongs_to :server

  def num_sites
    sites.length
  end

end
