module Demandbase
  class Record
    attr_accessor :company_name
    attr_accessor :demandbase_sid
    attr_accessor :marketing_alias
    attr_accessor :industry
    attr_accessor :sub_industry
    attr_accessor :employee_count
    attr_accessor :primary_sic
    attr_accessor :street_address
    attr_accessor :city
    attr_accessor :state
    attr_accessor :zip
    attr_accessor :country
    attr_accessor :country_name
    attr_accessor :phone
    attr_accessor :stock_ticker
    attr_accessor :web_site
    attr_accessor :annual_sales
    attr_accessor :revenue_range
    attr_accessor :employee_range
    attr_accessor :b2b
    attr_accessor :b2c
    attr_accessor :traffic
    attr_accessor :latitude
    attr_accessor :longitude
    attr_accessor :fortune_1000
    attr_accessor :forbes_2000

    # # Instantiate a new Demandbase Record from a domain name.
    # def initialize(domain)
    #   raise Demandbase::RTIDNotSetError if rtid_key.nil?

    #   begin
    #     query = cleanse_domain(domain)
    #     url = domain_api_url + "&query=#{query}"
    #   rescue => e
    #     raise Demandbase::ParseError
    #   end

    #   begin
    #     response = JSON.parse(RestClient.get(url))

    #     return nil unless response["domain"]

    #     @company_name     = response["domain"]["company_name"]
    #     @demandbase_sid   = response["domain"]["demandbase_sid"]
    #     @marketing_alias  = response["domain"]["marketing_alias"]
    #     @industry         = response["domain"]["industry"]
    #     @sub_industry     = response["domain"]["sub_industry"]
    #     @employee_count   = response["domain"]["employee_count"]
    #     @primary_sic      = response["domain"]["primary_sic"]
    #     @street_address   = response["domain"]["street_address"]
    #     @city             = response["domain"]["city"]
    #     @state            = response["domain"]["state"]
    #     @zip              = response["domain"]["zip"]
    #     @country          = response["domain"]["country"]
    #     @country_name     = response["domain"]["country_name"]
    #     @phone            = response["domain"]["phone"]
    #     @stock_ticker     = response["domain"]["stock_ticker"]
    #     @web_site         = response["domain"]["web_site"]
    #     @annual_sales     = response["domain"]["annual_sales"]
    #     @revenue_range    = response["domain"]["revenue_range"]
    #     @employee_range   = response["domain"]["employee_range"]
    #     @b2b              = response["domain"]["b2b"]
    #     @b2c              = response["domain"]["b2c"]
    #     @traffic          = response["domain"]["traffic"]
    #     @latitude         = response["domain"]["latitude"]
    #     @longitude        = response["domain"]["longitude"]
    #     @fortune_1000     = response["domain"]["fortune_1000"]
    #     @forbes_2000      = response["domain"]["forbes_2000"]
    #   rescue => e
    #     raise ServerError
    #   end
    # end

    # # Clean the domain of things like 'http(s)://', 'www',
    # # '?foo=bar', etc.
    # #
    # # Return the domain string.
    # def cleanse_domain(domain)
    #   domain.downcase!
    #   domain = domain.sub(/^https?\:\/\//, '').sub(/^www./,'')
    #   domain = domain.split(  "/").first
    #   domain = domain.split("@").last

    #   domain = PublicSuffix.parse(domain)
    #   domain = "#{domain.sld}.#{domain.tld}"
    #   domain
    # end

    # Return the Demandbase RTID from the environment.
    def rtid_key
      ENV['DEMANDBASE_RTID_KEY']
    end

    # # Return the base URL for the Demandbase domain API
    # def domain_api_url
    #   "http://api.demandbase.com/api/v1/domain.json?key=#{rtid_key}"
    # end

    # # Return the base URL for the Demandbase IP API
    # def ip_api_url
    #   "http://api.demandbase.com/api/v1/ip.json?key=#{rtid_key}"
    # end
  end
end