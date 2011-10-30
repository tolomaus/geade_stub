class Pcr < ActiveRecord::Base
  attr_accessible :code, :summary, :description, :app_id, :release_id
  validates :code, :presence => true
  validates :summary, :presence => true
  validates :description, :presence => true
  validates :app_id, :presence => true, :numericality => { :only_integer => true }
  validates :release_id, :presence => true, :numericality => { :only_integer => true }
end
