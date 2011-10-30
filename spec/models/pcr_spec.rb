require 'spec_helper'

describe Pcr do
  before(:each) do
    @pcr = Factory.build(:pcr)
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

  it "is not valid with a non-numeric app id" do
    @pcr.app_id = "abc"
    @pcr.should_not be_valid
  end
end
