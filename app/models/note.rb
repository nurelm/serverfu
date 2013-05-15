class Note < ActiveRecord::Base
  belongs_to :noteable, :polymorphic => true
  
  attr_accessible :note, :noteable_type
end
