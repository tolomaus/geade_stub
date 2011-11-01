class PcrsController < ApplicationController
  def index
    @pcrs = Pcr.all
  end

  def show
    @pcr = Pcr.find(params[:id])

  end

  def new
    @pcr=Pcr.new

    @apps = App.all
    @releases = Release.all
    @statuses = Status.all
    @severities = Severity.all
  end

  def create
    @pcr = Pcr.new(params[:pcr])
    if @pcr.save
      redirect_to @pcr, :flash => { :success => "PCR was successfully created." }
    else
      render 'new'
    end
  end

  def edit
    @pcr = Pcr.find(params[:id])

    @apps = App.all
    @releases = Release.all
    @statuses = Status.all
    @severities = Severity.all
  end

  def update
    @pcr = Pcr.find(params[:id])
    if @pcr.update_attributes(params[:pcr])
      redirect_to @pcr, :flash => { :success => "PCR was successfully updated." }
    else
      render 'edit'
    end
  end

  def destroy
    @pcr = Pcr.find(params[:id])
    @pcr.destroy
    redirect_to pcrs_path
  end
end
