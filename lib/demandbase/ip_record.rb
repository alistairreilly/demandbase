module Demandbase
  class IPRecord < Demandbase::Record
    attr_accessor :ip
    attr_accessor :audience
    attr_accessor :audience_segment
    attr_accessor :information_level
    attr_accessor :worldhq_sid
    attr_accessor :domestichq_sid
    attr_accessor :hq_sid
    attr_accessor :isp

    # Return the base URL for the Demandbase domain API
    def api_url
      "http://api.demandbase.com/api/v1/domain.json?key=#{rtid_key}"
    end
  end
end