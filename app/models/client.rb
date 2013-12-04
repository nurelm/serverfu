class Client < ActiveRecord::Base
  has_many :note, :as => :noteable
  has_many :contact, :as => :contactable
  has_many :sites
  belongs_to :server

  def num_sites
    sites.length
  end

end
