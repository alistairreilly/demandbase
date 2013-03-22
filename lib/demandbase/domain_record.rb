module Demandbase
  class DomainRecord < Demandbase::Record

    # Return the base URL for the Demandbase domain API
    def api_url
      "http://api.demandbase.com/api/v1/domain.json?key=#{rtid_key}"
    end

    # Ascertain whether the given query string is a valid domain name.
    #
    # Returns true if it's a valid domain name; false otherwise.
    def is_domain(query)
      begin
        PublicSuffix.valid?(cleanse_domain(query))
      rescue
        false
      end
    end

    # Instantiate a new Demandbase Domain Record from a domain name.
    def initialize(domain)
      raise Demandbase::RTIDNotSetError if rtid_key.nil?

      begin
        query = cleanse_domain(domain)
        url = api_url + "&query=#{query}"
      rescue => e
        raise Demandbase::ParseError
      end

      begin
        response = JSON.parse(RestClient.get(url))

        return nil unless response["domain"]

        @company_name     = response["domain"]["company_name"]
        @demandbase_sid   = response["domain"]["demandbase_sid"]
        @marketing_alias  = response["domain"]["marketing_alias"]
        @industry         = response["domain"]["industry"]
        @sub_industry     = response["domain"]["sub_industry"]
        @employee_count   = response["domain"]["employee_count"]
        @primary_sic      = response["domain"]["primary_sic"]
        @street_address   = response["domain"]["street_address"]
        @city             = response["domain"]["city"]
        @state            = response["domain"]["state"]
        @zip              = response["domain"]["zip"]
        @country          = response["domain"]["country"]
        @country_name     = response["domain"]["country_name"]
        @phone            = response["domain"]["phone"]
        @stock_ticker     = response["domain"]["stock_ticker"]
        @web_site         = response["domain"]["web_site"]
        @annual_sales     = response["domain"]["annual_sales"]
        @revenue_range    = response["domain"]["revenue_range"]
        @employee_range   = response["domain"]["employee_range"]
        @b2b              = response["domain"]["b2b"]
        @b2c              = response["domain"]["b2c"]
        @traffic          = response["domain"]["traffic"]
        @latitude         = response["domain"]["latitude"]
        @longitude        = response["domain"]["longitude"]
        @fortune_1000     = response["domain"]["fortune_1000"]
        @forbes_2000      = response["domain"]["forbes_2000"]
      rescue => e
        raise ServerError
      end
    end

    # Clean the domain of things like 'http(s)://', 'www',
    # '?foo=bar', etc.
    #
    # Return the domain string.
    def cleanse_domain(domain)
      domain.downcase!
      domain = domain.sub(/^https?\:\/\//, '').sub(/^www./,'')
      domain = domain.split(  "/").first
      domain = domain.split("@").last

      domain = PublicSuffix.parse(domain)
      domain = "#{domain.sld}.#{domain.tld}"
      domain
    end

  end
end