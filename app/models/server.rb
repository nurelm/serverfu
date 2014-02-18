class Server < ActiveRecord::Base
  has_many :notes, :as => :noteable
  has_many :contacts, :as => :contactable
  has_many :clients
  has_many :ips
  belongs_to :host

  def num_clients
    clients.length
  end

  def num_sites
    num_sites = 0
    clients.each do |client|
      num_sites += client.sites.length
    end
    num_sites
  end

end
