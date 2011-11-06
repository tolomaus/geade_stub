require 'spec_helper'

describe PcrsController do
  render_views

  describe "GET 'index'" do
    before(:each) do
      @pcrs=Array.new
      @pcrs.push Factory(:pcr)
      @pcrs.push Factory(:pcr)
      @pcrs.push Factory(:pcr)
    end
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "should find all pcrs" do
      get :index
      assigns(:pcrs).include?(@pcrs[0]).should be_true
      assigns(:pcrs).include?(@pcrs[1]).should be_true
      assigns(:pcrs).include?(@pcrs[2]).should be_true
    end
    it "should not find the wrong pcrs" do
      get :index
      assigns(:pcrs).include?(Factory(:pcr)).should be_false
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
    before(:each) do
      @pcr = Pcr.new
      Pcr.stub!(:new).and_return(@pcr)
    end
    it "should be successful" do
      get :new
      response.should be_success
    end
    it "should create a new pcr" do
      get :new
      assigns(:pcr).should == @pcr
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = Factory.attributes_for(:pcr).except(:code)
      end
      it "should be successful" do
        post :create, :pcr => @attr
        response.should be_success
      end
      it "should not create a pcr" do
        expect {
          post :create, :pcr => @attr
        }.not_to change(Pcr, :count)
      end
      it "should render the 'new' page" do
        post :create, :pcr => @attr
        response.should render_template 'new'
      end
    end
    describe "success" do
      before(:each) do
        @attr = Factory.attributes_for(:pcr_view)
      end
      it "should create a pcr" do
        expect {
          post :create, :pcr => @attr
        }.to change(Pcr, :count).by(1)
      end
      it "should redirect to the pcr show page" do
        post :create, :pcr => @attr
        response.should redirect_to(pcr_path(assigns(:pcr)))
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @pcr = Factory(:pcr)
    end
    it "should be successful" do
      get :edit, :id => @pcr
      response.should be_success
    end
    it "should find the right pcr" do
      get :edit, :id => @pcr
      assigns(:pcr).should == @pcr
    end
  end

  describe "PUT 'update'" do
    describe "failure (due to empty code)" do
      before(:each) do
        @pcr = Factory(:pcr)
        @old_code = @pcr.code
        @pcr.code = ""
        @attr = @pcr.attributes
      end
      it "should be successful" do
        put 'update', :id => @pcr, :pcr => @attr
        response.should be_success
      end
      it "should render the 'edit' page" do
        put 'update', :id => @pcr, :pcr => @attr
        response.should render_template 'edit'
      end
      it "should not update the pcr" do
        put 'update', :id => @pcr, :pcr => @attr
        @pcr.reload.code.should == @old_code
      end
    end
    describe "success" do
      before(:each) do
        @pcr = Factory(:pcr)
        @pcr.description += " - updated"
        @attr = @pcr.attributes
      end
      it "should update the pcr" do
        put 'update', :id => @pcr, :pcr => @attr
        @pcr.reload.description.should =~ / - updated/
      end
      it "should redirect to the pcr show page" do
        put 'update', :id => @pcr, :pcr => @attr
        response.should redirect_to(pcr_path(assigns(:pcr)))
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @pcr = Factory(:pcr)
    end
    it "should delete the pcr" do
      expect {
        delete :destroy, :id => @pcr
      }.to change(Pcr, :count).by(-1)
    end
    it "should redirect to the pcrs page" do
      delete :destroy, :id => @pcr
      response.should redirect_to(pcrs_path)
    end
  end

end
