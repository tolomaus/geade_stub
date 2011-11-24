require 'spec_helper'

describe Dependency do
  before(:each) do
    @child_pcr = Factory.create(:pcr)
    @parent_pcr = Factory.create(:pcr)
    @dependency = @child_pcr.dependencies.build(:parent_id => @parent_pcr.id)
  end

  it "should create a new instance" do
    @dependency.save!
  end

  it "should have a follower attribute" do
    @dependency.should respond_to(:parent)
  end

  it "should have the right follower" do
    @dependency.parent.should == @parent_pcr
  end

  it "should have a followed attribute" do
    @dependency.should respond_to(:child)
  end

  it "should have the right followed user" do
    @dependency.child.should == @child_pcr
  end

end
