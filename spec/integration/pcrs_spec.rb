require 'spec_helper'

describe "Pcrs" do
  describe "'index' page" do
    before(:each) do
      @pcr=Factory(:pcr)
    end
    it "should show the pcrs" do
      visit pcrs_path

      page.should have_content(@pcr.code)
      page.should have_content(@pcr.summary)
      page.should have_content(@pcr.description)
    end
  end
  describe "'new' page" do
    before(:each) do
      @attr=Factory.attributes_for(:pcr_primitive)
      @app_name=App.first.name
      @release_name=Release.first.name
      @status_description=Status.first.description
      @severity_description=Severity.first.description
    end
    it "should create a new pcr" do
      visit pcrs_path

      click_on("New PCR")

      current_path.should == new_pcr_path

      fill_in('Code', :with => @attr[:code])
      fill_in('Summary', :with => @attr[:summary])
      fill_in('Description', :with => @attr[:description])
      select(@app_name, :from => "App")
      select(@release_name, :from => "Release")
      select(@status_description, :from => "Status")
      select(@severity_description, :from => "Severity")

      expect{
        click_on("Create Pcr")
      }.to change(Pcr, :count).by(1)

      page.should have_content("PCR was successfully created.")
      current_path.should == pcr_path(Pcr.find_by_code(@attr[:code]))
    end
  end
  describe "'edit' page" do
    before(:each) do
      @pcr=Factory(:pcr)
    end
    it "should update a pcr" do
      visit pcrs_path

      click_on("Edit")

      current_path.should == edit_pcr_path(@pcr)

      fill_in('Description', :with => @pcr.description += " - updated")

      click_on("Update Pcr")

      @pcr.reload.description.should =~ / - updated/
      page.should have_content("PCR was successfully updated.")
      current_path.should == pcr_path(@pcr)
    end
  end
  describe "'destroy' page" do
    before(:each) do
      @pcr=Factory(:pcr)
    end
    it "should destroy a pcr" do
      visit pcrs_path

      expect{
        click_on("Destroy")
      }.to change(Pcr, :count).by(-1)

      current_path.should == pcrs_path
    end
  end
end
