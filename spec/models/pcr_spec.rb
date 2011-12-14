require 'spec_helper'

describe Pcr do
  before(:each) do
    @pcr = Factory.create(:pcr)
    @parent_pcr = Factory.create(:pcr)
  end

  describe "relationships" do
    it "should have a dependencies method" do
      @pcr.should respond_to(:dependencies)
    end

    it "should have a parents method" do
      @pcr.should respond_to(:parents)
    end

    it "should have a depending_on? method" do
      @pcr.should respond_to(:depending_on?)
    end

    it "should have a depend_on! method" do
      @pcr.should respond_to(:depend_on!)
    end

    it "should depend on another pcr" do
      @pcr.depend_on!(@parent_pcr)
      @pcr.should be_depending_on(@parent_pcr)
    end

    it "should include the parent pcr in the following array" do
      @pcr.depend_on!(@parent_pcr)
      @pcr.parents.should include(@parent_pcr)
    end

    it "should have an undepend_on! method" do
      @pcr.should respond_to(:undepend_on!)
    end

    it "should not depend on a pcr" do
      @pcr.depend_on!(@parent_pcr)
      @pcr.undepend_on!(@parent_pcr)
      @pcr.should_not be_depending_on(@parent_pcr)
    end
  end

  it "is valid with proper values" do
    @pcr.should be_valid
  end

  it "is not valid without a pcr id" do
    @pcr.code = nil
    @pcr.should_not be_valid
  end

  it "is not valid without a description" do
    @pcr.description = nil
    @pcr.should_not be_valid
  end

  it "is not valid without an app" do
    @pcr.app_id = nil
    @pcr.should_not be_valid
  end

  it "is not valid without a release" do
    @pcr.release_id = nil
    @pcr.should_not be_valid
  end

  it "is not valid without a status" do
    @pcr.status_id = nil
    @pcr.should_not be_valid
  end

  it "is not valid without a severity" do
    @pcr.severity_id = nil
    @pcr.should_not be_valid
  end

  it "is not valid with a non-numeric app id" do
    @pcr.app_id = "abc"
    @pcr.should_not be_valid
  end
end
