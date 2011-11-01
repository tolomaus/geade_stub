require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    #TODO: doesn't work anymore since adding capybara ...
    #it "should have the right title" do
    #  get 'home'
    #  response.should have_selector("title", :content => "Geade Stub | Home")
    #end
  end

end
