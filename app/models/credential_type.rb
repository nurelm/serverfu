class CredentialType < ActiveRecord::Base
  has_many :credential

  attr_accessible :type
end
