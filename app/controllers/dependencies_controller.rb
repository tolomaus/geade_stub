class DependenciesController < ApplicationController
  def create
    @pcr = Pcr.find(params[:dependency][:child_id])
    @parent_pcr = Pcr.find(params[:dependency][:parent_id])
    @pcr.depend_on!(@parent_pcr)
    respond_to do |format|
      format.html { redirect_to @pcr }
      format.js do
        @other_pcr = @parent_pcr
        render "update_dependency"
      end
    end
  end

  def destroy
    @pcr = Dependency.find(params[:id]).child
    @parent_pcr = Dependency.find(params[:id]).parent
    @pcr.undepend_on!(@parent_pcr)
    respond_to do |format|
      format.html { redirect_to @pcr }
      format.js do
        @other_pcr = @parent_pcr
        render "update_dependency"
      end
    end
  end

end
