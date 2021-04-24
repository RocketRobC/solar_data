require "http/client"

class ApiRequester
  getter :start_time, :end_time, :site

  def initialize(@start_time : String, @end_time : String, @site : Site)
  end

  def data
    client = HTTP::Client.new(site.base_api_url, 443, true)
    client.get(url(start_time, end_time)).body
  end

  private def url(start_time, end_time)
    f_start = format_request_time(start_time)
    f_end = format_request_time(end_time)
    "/site/#{site.site_id}/energyDetails?api_key=#{site.api_key}&startTime=#{f_start}&endTime=#{f_end}"
  end

  private def format_request_time(timestamp)
    timestamp.gsub(" ", "%20")
  end
end
