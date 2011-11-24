class ReleasemeController < ApplicationController
  def change_request_updated
    Rails.logger.info params
    format.xml  { head :ok }
  end
end
