require 'spec_helper'

describe PcrsController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @pcr = Factory(:pcr)
    end
    it "should be successful" do
      get :show, :id => @pcr
      response.should be_success
    end
    it "should find the right pcr" do
      get :show, :id => @pcr
      assigns(:pcr).should == @pcr
    end

  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post :create, :pcr => {}
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update', :id => @pcr
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => @pcr
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id => @pcr
      response.should be_success
    end
  end

end
