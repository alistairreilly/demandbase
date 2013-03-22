require 'helper'

class TestDemandbase < Test::Unit::TestCase
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
      puts government_agency
      assert_equal true, Demandbase::is_government?(government_agency), government_agency
    end

    non_government_agencies.each do |non_government_agency|
      assert_equal false, Demandbase::is_government?(non_government_agency), non_government_agency
    end
  end

end
