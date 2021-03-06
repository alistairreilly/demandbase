require 'helper'

class TestDemandbaseRecord <  Minitest::Test
  should "remember to set DEMANDBASE_RTID_KEY" do
    assert ENV['DEMANDBASE_RTID_KEY'], "Please set your $DEMANDBASE_RTID_KEY"
  end

  should "recognize academic institutions" do
    record = Demandbase::lookup 'stanford.edu'
    assert_equal true, record.is_academic?
  end

  # should "recognize government institutions" do
  #   record = Demandbase::lookup 'fbi.gov'
  #   assert_equal true, record.is_government?
  # end

  # should "initialize a new record with a valid domain" do
  #   domain = 'github.com'
  #   record = Demandbase::Record.new(domain)

  #   assert_equal "Github Inc",            record.company_name # dat h ಠ_ಠ
  #   assert_equal 22528943,                record.demandbase_sid
  #   assert_equal "Github",                record.marketing_alias
  #   assert_equal "Software & Technology", record.industry
  #   assert_equal "Software Applications", record.sub_industry
  #   assert_equal 30,                      record.employee_count
  #   assert_equal "7372",                  record.primary_sic
  #   assert_equal "548 4th St",            record.street_address
  #   assert_equal "San Francisco",         record.city
  #   assert_equal "CA",                    record.state
  #   assert_equal "94107",                 record.zip
  #   assert_equal "US",                    record.country
  #   assert_equal "United States",         record.country_name
  #   assert_equal "415-409-8053",          record.phone
  #   assert_equal nil,                     record.stock_ticker
  #   assert_equal "github.com",            record.web_site
  #   assert_equal 6240000,                 record.annual_sales
  #   assert_equal "$5M - $10M",            record.revenue_range
  #   assert_equal "Small",                 record.employee_range
  #   assert_equal true,                    record.b2b
  #   assert_equal true,                    record.b2c
  #   assert_equal "Very High",             record.traffic
  #   assert_equal 37.7789,                 record.latitude
  #   assert_equal -122.398,                record.longitude
  #   assert_equal false,                   record.fortune_1000 # TODO: fix this test in 2017
  #   assert_equal false,                   record.forbes_2000  # TODO: fix this test in 2016
  # end

  # should "initialize a new record with a subdomain" do
  #   queries = [
  #     "github.com",
  #     "www.github.com",
  #     "developer.github.com/",
  #     "http://www.github.com/",
  #     "https://www.github.com",
  #     "https://www.github.com/leereilly/demandbase",
  #     "lee@github.com"
  #   ]

  #   queries.each do |query|
  #     record = Demandbase::Record.new(query)
  #     assert_equal "github.com", record.web_site, "with #{query}"
  #   end
  # end

  # should "should return nil if no record is found" do
  #   record = Demandbase::lookup('leereilly.net')
  # end

  # should "raise an RTIDNotSetError if no DEMANDBASE_RTID_KEY is set" do
  #   Demandbase::Record.any_instance.stubs(:rtid_key).returns(nil)
  #   assert_raise(Demandbase::RTIDNotSetError) { Demandbase::lookup('github.com') }
  #   Demandbase::Record.any_instance.unstub(:rtid_key)
  # end

  # should "raise a ParseError if the domain doesn't look valid" do
  #   assert_raise(Demandbase::ParseError) { Demandbase::lookup('NOPE') }
  # end

  # should "raise a ServerError if there's a problem communicating with the Demandbase server" do
  #   Demandbase::Record.any_instance.stubs(:domain_api_url).returns('http://www.example.com')
  #   assert_raise(Demandbase::ServerError) { Demandbase::lookup('github.com') }
  #   Demandbase::Record.any_instance.unstub(:domain_api_url)
  # end
end
