require 'spec_helper'

describe DependenciesController do

  describe "POST 'update_dependency'" do

    before(:each) do
      @pcr = Factory(:pcr)
      @parent_pcr = Factory(:pcr)
    end

    it "should update_dependency a dependency" do
      lambda do
        post :create, :dependency => { :child_id => @pcr, :parent_id => @parent_pcr }
        response.should be_redirect
      end.should change(Dependency, :count).by(1)
    end

    it "should update_dependency a dependency using Ajax" do
      lambda do
        xhr :post, :create, :dependency => { :child_id => @pcr, :parent_id => @parent_pcr }
        response.should be_success
      end.should change(Dependency, :count).by(1)
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @pcr = Factory(:pcr)
      @parent_pcr = Factory(:pcr)
      @pcr.depend_on!(@parent_pcr)
      @dependency = @pcr.dependencies.find_by_parent_id(@parent_pcr)
    end

    it "should destroy a dependency" do
      lambda do
        delete :destroy, :id => @dependency
        response.should be_redirect
      end.should change(Dependency, :count).by(-1)
    end

    it "should destroy a dependency using Ajax" do
      lambda do
        xhr :delete, :destroy, :id => @dependency
        response.should be_success
      end.should change(Dependency, :count).by(-1)
    end
  end
end
