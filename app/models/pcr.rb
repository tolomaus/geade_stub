class Pcr < ActiveRecord::Base
  validates :pcr_id, :presence => true
  validates :description, :presence => true
  validates :app_id, :presence => true, :numericality => { :only_integer => true }
  validates :release_id, :presence => true, :numericality => { :only_integer => true }
end
