class Pcr < ActiveRecord::Base
  attr_accessible :code, :summary, :description, :app_id, :release_id, :status_id, :severity_id
  validates :code, :presence => true
  validates :summary, :presence => true
  validates :description, :presence => true
  validates :app_id, :presence => true, :numericality => { :only_integer => true }
  validates :release_id, :presence => true, :numericality => { :only_integer => true }
  validates :status_id, :presence => true, :numericality => { :only_integer => true }
  validates :severity_id, :presence => true, :numericality => { :only_integer => true }

  belongs_to :app
  belongs_to :release
  belongs_to :status
  belongs_to :severity
  has_many :dependencies, :foreign_key => "child_id",
                           :dependent => :destroy
  has_many :parents, :through => :dependencies

  def depending_on?(pcr)
    self.dependencies.find_by_parent_id(pcr)
  end

  def depend_on!(pcr)
    self.dependencies.create!(:parent_id => pcr.id)
  end

  def undepend_on!(pcr)
    self.dependencies.find_by_parent_id(pcr).destroy
  end
end
