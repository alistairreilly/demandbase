require 'helper'

class TestDemandbaseIPRecord <  Minitest::Test
  should "initialize a new record with a valid ip" do
    ip = '68.65.169.67'
    record = Demandbase::IPRecord.new(ip)

    assert_equal "Stanford University", record.registry_company_name
    assert_equal "Stanford", record.registry_city
    assert_equal "CA", record.registry_state
    assert_equal "94305", record.registry_zip_code
    assert_equal 650, record.registry_area_code
    assert_equal "United States", record.registry_country
    assert_equal "US", record.registry_country_code
    assert_equal 37.41780090332031, record.registry_latitude
    assert_equal -122.1719970703125, record.registry_longitude
    assert_equal "Stanford University", record.company_name    # typo intentional
    assert_equal 77761, record.demandbase_sid
    assert_equal "Stanford University", record.marketing_alias # typo intentional
    assert_equal "Education", record.industry
    assert_equal "University", record.sub_industry
    assert_equal 9800, record.employee_count
    assert_equal false, record.isp
    assert_equal "8221", record.primary_sic
    assert_equal "450 Serra Mall", record.street_address
    assert_equal "Stanford", record.city
    assert_equal "CA", record.state
    assert_equal "94305", record.zip
    assert_equal "US", record.country
    assert_equal "United States", record.country_name
    assert_equal "650-723-0855", record.phone
    assert_equal nil, record.stock_ticker
    assert_equal "stanford.edu", record.web_site
    assert_equal 18750000, record.annual_sales
    assert_equal "$10M - $25M", record.revenue_range
    assert_equal "Enterprise", record.employee_range
    assert_equal true, record.b2b
    assert_equal true, record.b2c
    assert_equal "Very High", record.traffic
    assert_equal 37.429, record.latitude
    assert_equal -122.17, record.longitude
    assert_equal false, record.fortune_1000
    assert_equal false, record.forbes_2000
    assert_equal "Detailed", record.information_level
    assert_equal "Education", record.audience
    assert_equal "University", record.audience_segment
    assert_equal "68.65.169.67", record.ip
  end

  should "return nil if no record is found" do
    record = Demandbase::IPRecord::new('127.0.0.1')
  end
end
