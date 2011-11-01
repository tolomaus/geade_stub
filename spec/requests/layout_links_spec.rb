require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
    it "should visit the homepage" do
      visit root_path#'/'
      page.should have_xpath("//title", :text => "Geade Stub | Home")
    end
  end
end
