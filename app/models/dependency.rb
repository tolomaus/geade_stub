class Dependency < ActiveRecord::Base
  attr_accessible :parent_id

  belongs_to :child, :class_name => "Pcr"
  belongs_to :parent, :class_name => "Pcr"

  validates :child_id, :presence => true
  validates :parent_id, :presence => true
end
