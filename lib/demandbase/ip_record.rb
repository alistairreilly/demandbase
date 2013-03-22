module Demandbase
  class IPRecord < Demandbase::Record
    attr_accessor :registry_company_name
    attr_accessor :registry_city
    attr_accessor :registry_state
    attr_accessor :registry_zip_code
    attr_accessor :registry_area_code
    attr_accessor :registry_country
    attr_accessor :registry_country_code
    attr_accessor :registry_latitude
    attr_accessor :registry_longitude
    attr_accessor :ip
    attr_accessor :information_level
    attr_accessor :audience
    attr_accessor :audience_segment
    attr_accessor :information_level
    attr_accessor :worldhq_sid
    attr_accessor :domestichq_sid
    attr_accessor :hq_sid
    attr_accessor :isp

    # Return the base URL for the Demandbase IP API
    def api_url
      "http://api.demandbase.com/api/v2/ip.json?key=#{rtid_key}"
    end

    # Instantiate a new Demandbase IP Record from an IP address.
    def initialize(ip)
      raise Demandbase::RTIDNotSetError if rtid_key.nil?

      begin
        url = api_url + "&query=#{ip}"
      rescue => e
        raise Demandbase::ParseError
      end

      begin
        response = JSON.parse(RestClient.get(url))
        return nil unless response

        @registry_company_name  = response["registry_company_name"]
        @registry_city          = response["registry_city"]
        @registry_state         = response["registry_state"]
        @registry_zip_code      = response["registry_zip_code"]
        @registry_area_code     = response["registry_area_code"]
        @registry_country       = response["registry_country"]
        @registry_country_code  = response["registry_country_code"]
        @registry_latitude      = response["registry_latitude"]
        @registry_longitude     = response["registry_longitude"]
        @company_name           = response["company_name"]
        @demandbase_sid         = response["demandbase_sid"]
        @marketing_alias        = response["marketing_alias"]
        @industry               = response["industry"]
        @sub_industry           = response["sub_industry"]
        @employee_count         = response["employee_count"]
        @primary_sic            = response["primary_sic"]
        @street_address         = response["street_address"]
        @city                   = response["city"]
        @state                  = response["state"]
        @zip                    = response["zip"]
        @country                = response["country"]
        @country_name           = response["country_name"]
        @phone                  = response["phone"]
        @stock_ticker           = response["stock_ticker"]
        @web_site               = response["web_site"]
        @annual_sales           = response["annual_sales"]
        @revenue_range          = response["revenue_range"]
        @employee_range         = response["employee_range"]
        @b2b                    = response["b2b"]
        @b2c                    = response["b2c"]
        @traffic                = response["traffic"]
        @latitude               = response["latitude"]
        @longitude              = response["longitude"]
        @fortune_1000           = response["fortune_1000"]
        @forbes_2000            = response["forbes_2000"]
        @ip                     = response["ip"]
        @audience               = response["audience"]
        @audience_segment       = response["audience_segment"]
        @information_level      = response["information_level"]
        @worldhq_sid            = response["worldhq_sid"]
        @domestichq_sid         = response["domestichq_sid"]
        @hq_sid                 = response["hq_sid"]
        @isp                    = response["isp"]
      rescue RestClient::ResourceNotFound => rcrnf
        return nil
      rescue
        raise ServerError
      end
    end
  end
end