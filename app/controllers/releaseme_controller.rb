class ReleasemeController < ApplicationController
  def change_request_updated
    logger.info ""
    logger.info ">>>>>>>>>>>>> ReleaseMe server (localhost) <<<<<<<<<<<<<<<<<<<"
    logger.info "change_request_updated call received"
    logger.info "parameters:"
    logger.info params
    logger.info ">>>>>>>>>>>>> ReleaseMe server (localhost) <<<<<<<<<<<<<<<<<<<"
    logger.info ""

    render :text => "OK\nparameters:\n#{params}"
  end
end
