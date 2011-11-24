class Dependency < ActiveRecord::Base
  attr_accessible :parent_id

  belongs_to :child, :class_name => "Pcr"
  belongs_to :parent, :class_name => "Pcr"
end
