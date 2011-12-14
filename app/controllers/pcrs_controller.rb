class PcrsController < ApplicationController
  def index
    @pcrs = Pcr.all
  end

  def show
    @pcr = Pcr.find(params[:id])
  end

  def new
    @pcr=Pcr.new

    load_collections
  end

  def create
    @pcr = Pcr.new(params[:pcr])
    if @pcr.save
      response = ReleaseMeService.new.change_request_updated @pcr
      redirect_to @pcr, :flash => { :success => "PCR was successfully created. Response from ReleaseMe (#{::Rails.application.config.release_me_server}): #{response}" }
    else
      load_collections
      render 'new'
    end
  end

  def edit
    @pcr = Pcr.find(params[:id])

    load_collections()
  end

  def update
    @pcr = Pcr.find(params[:id])
    if @pcr.update_attributes(params[:pcr])
      response = ReleaseMeService.new.change_request_updated @pcr
      redirect_to @pcr, :flash => { :success => "PCR was successfully updated. Response from ReleaseMe (#{::Rails.application.config.release_me_server.host}): #{CGI.unescape(response)}" }
    else
      load_collections
      render 'edit'
    end
  end

  def destroy
    @pcr = Pcr.find(params[:id])
    @pcr.destroy
    redirect_to pcrs_path
  end

  def parents
    @pcr = Pcr.find(params[:id])
    @pcrs = Pcr.all
    @pcrs.delete(@pcr)
  end

  private

  def load_collections
    @apps = App.all
    @releases = Release.all
    @statuses = Status.all
    @severities = Severity.all
  end
end
