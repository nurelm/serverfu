class Credential < ActiveRecord::Base
  belongs_to :site
  belongs_to :credential_type

  attr_accessible :description, :domain, :password, :site, :username
end
