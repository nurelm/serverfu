class Domain < ActiveRecord::Base
  belongs_to :site

  attr_accessible :name, :site
end
