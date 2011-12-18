require 'net/http'

class ReleaseMeService
  def change_request_updated(pcr)
    #call the ReleaseMe REST web service
    if Rails.env.test?
      return "OK"
    else
      return fetch_url("/REST/change_request_updated?" +   \
                          "changeRequestId=#{pcr.code}&" +   \
                          "summary=#{URI.encode(pcr.summary)}&" +   \
                          "description=#{URI.encode(pcr.description)}&" +   \
                          "applicationId=#{pcr.app_id}&" +   \
                          "releaseId=#{pcr.release_id}&" +   \
                          "status=#{pcr.status.code}&" +   \
                          "severity=#{pcr.severity.code}&" +   \
                          "linkedChangeRequests=#{pcr.parents.map {|p_pcr| p_pcr.code}.join("-")}")
    end
  end

  private
    def fetch_url(path)
      http = Net::HTTP.new(RELEASEME_CONFIG['host'], RELEASEME_CONFIG['port'])
      if ::Rails.application.config.release_me_server.use_ssl
        http.use_ssl = RELEASEME_CONFIG['use_ssl'] == 'true' ? true : false
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = "/soft/releaseme/home/ssl/cert_bundle.crt"
      end

      Rails.logger.info "Calling ReleaseMe server #{::Rails.application.config.release_me_server.host}:#{::Rails.application.config.release_me_server.port} with path #{path}"
      response = http.get(path)
      Rails.logger.info "response: #{response.body}"
      return response.body
    end
end