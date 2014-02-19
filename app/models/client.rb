class Client < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :contacts, :as => :contactable
  has_many :sites
  belongs_to :server

  def num_sites
    sites.length
  end

  def ip_collection
    ip_collection = []
    server.ips.order(':address').each do |ip|
      ip_collection << [ip.id, ip.address]
    end
    ip_collection
  end

end
