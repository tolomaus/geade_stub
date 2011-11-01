class App < ActiveRecord::Base
  attr_accessible :code, :name
  validates :code, :presence => true
  validates :name, :presence => true
end
