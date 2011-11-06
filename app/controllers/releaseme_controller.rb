class ReleasemeController < ApplicationController
  def pcr_updated
    Rails.logger.info params
    format.xml  { head :ok }
  end
end
