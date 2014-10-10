require 'helper'

class TestDemandbase <  Minitest::Test
  should "ensure lazy_lookup sticks around as an aliased lookup method for early adopters" do
    Demandbase.method(:lazy_lookup) == Demandbase.method(:lookup)
  end

  should "lazily lookup domain names" do
    assert_equal Demandbase::DomainRecord, Demandbase::lookup('stanford.edu').class
  end

  should "lazily lookup IPv4 addresses" do
    assert_equal Demandbase::IPRecord, Demandbase::lookup('68.65.169.67').class
  end

  should "get a record for Stanford University's domain name" do
    assert_equal 'Stanford', Demandbase::lookup_domain('stanford.edu').company_name
  end

  should "get a record for a Stanford Uniersity IP" do
    assert_equal 'Stanford Uniersity', Demandbase::lookup_ip('68.65.169.67').company_name # typo intentional
  end

  should "be able to lazily lookup" do
    assert_equal "Demandbase::IPRecord", Demandbase::lookup('68.65.169.67').class.to_s
    assert_equal "Demandbase::DomainRecord", Demandbase::lookup('github.com').class.to_s
  end

  should "know a school by domain name" do
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

  should "know a goverment agency / body by domain name" do
    government_agencies = [
      'jgi.doe.gov',
      'cia.gov',
      'glasgow.gov.uk',
      #'lanl.gov'
      #'gchq.gov.uk'
    ]

    non_government_agencies = [
      'rangers.co.uk',
      'leereilly.net'
    ]

    government_agencies.each do |government_agency|
      assert_equal true, Demandbase::is_government?(government_agency), government_agency
    end

    non_government_agencies.each do |non_government_agency|
      assert_equal false, Demandbase::is_government?(non_government_agency), non_government_agency
    end
  end

  should "know a nonprofit by domain name" do
    nonprofits = [
      'gatesfoundation.org',
      'bhf.org.uk'
      #'rspca.org.uk',
      #'runningchicken.org'

    ]

    non_nonprofits = [ # nonprofit
      'rangers.co.uk',
      'leereilly.net'
    ]

    nonprofits.each do |nonprofit|
      assert_equal true, Demandbase::is_nonprofit?(nonprofit), nonprofit
    end

    non_nonprofits.each do |non_nonprofit|
      assert_equal false, Demandbase::is_nonprofit?(non_nonprofit), non_nonprofit
    end
  end

end
