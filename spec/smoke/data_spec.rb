require 'spec_helper'

describe "Data: " do
  describe "seeds" do
    it "should exist in the database" do
      App.count.should_not == 0
      Release.count.should_not == 0
      Status.count.should_not == 0
      Severity.count.should_not == 0
    end
  end
end
