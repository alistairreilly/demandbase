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

    # Return the Demandbase RTID from the environment.
    def rtid_key
      ENV['DEMANDBASE_RTID_KEY']
    end

    def is_academic?
      if Demandbase::ACADEMIC_SIC_CODES.include?(primary_sic)
        return true
      else
        return false
      end
    end

    def is_government?
      if Demandbase::GOVERNMENT_SIC_CODES.include?(primary_sic)
        return true
      else
        return false
      end
    end

    def is_nonprofit?
    if Demandbase::NONPROFIT_SIC_CODES.include?(primary_sic)
        return true
      else
        return false
      end
    end
  end
end