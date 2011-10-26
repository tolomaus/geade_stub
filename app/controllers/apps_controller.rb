class AppsController < ApplicationController
  def new
    @pcr=Pcr.new
    @title="New PCR"
  end

  def create
    @pcr = Pcr.new(params[:pcr])
    if @pcr.save
      redirect_to @pcr, :flash => { :success => "PCR was successfully created." }
    else
      render 'new'
    end
  end

  def update
    @pcr = Pcr.find(params[:id])
    if @pcr.update_attributes(params[:pcr])
      redirect_to @pcr, :flash => { :success => "PCR was successfully updated." }
    else
      render 'new'
    end
  end

  def edit
    @pcr = Pcr.find(params[:id])
  end

  def destroy
    @pcr = Pcr.find(params[:id])
    @pcr.destroy
    redirect_to pcrs_path
  end

  def index
    @pcrs = Pcr.all
  end

  def show
    @pcr = Pcr.find(params[:id])
  end

end
