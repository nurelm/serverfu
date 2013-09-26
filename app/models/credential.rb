class Credential < ActiveRecord::Base
  belongs_to :site
  belongs_to :credential_type
end
