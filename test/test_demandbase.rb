require 'helper'

class TestDemandbase < Test::Unit::TestCase
  should "get a record for Stanford University" do
    #assert_equal 'Stanford University', Demandbase::lookup_domain('stanford.edu')
  end

  should "get a record for the University of Strathclyde" do

  end

  should "get a record for a GitHub's IP address" do

  end

  should "recognize IP addresses" do

  end

  should "recognize domain names" do

  end

  should "handle multiple formats" do
    queries = [
      "microsoft.com",
      "www.microsoft.com",
      "developer.hacks.microsoft.com",
      "http://www.microsoft.com",
      "https://www.microsofot.com",
      "william.gates@microsoft.com",
      "microsoft.co.uk"
    ]
  end

  should "return nothing when no record is found" do

  end

  should "throw an exception when the service is down" do

  end

  should "know a school" do
    schools = [
      'strath.ac.uk',
      'stanford.edu',
      'walnutcreeksd.org'
    ]

    not_schools = [
      'lanl.gov',
      'microsoft.com'
    ]

    schools.each do |school|
      assert_equal true, Demandbase::is_academic?(school)
    end

    not_schools.each do |school|
      assert_equal false, Demandbase::is_academic?(school)
    end
  end

end
