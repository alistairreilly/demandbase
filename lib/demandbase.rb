require 'json'
require 'public_suffix'
require 'resolv'
require 'rest_client'

require 'demandbase/error'
require 'demandbase/record'
require 'demandbase/ip_record'
require 'demandbase/domain_record'

module Demandbase

  # Standard Industrial Classification (SIC) codes for organizations providing
  # elementary, secondary, tertiary, or quaternary education.
  #
  # See https://github.com/leereilly/csi/blob/master/lib/data/master.toml for
  # a complete list.
  ACADEMIC_SIC_CODES = [
    "82",   # educational services
    "821",  # elementary and secondary schools
    "8211", # elementary and secondary schools
    "822",  # colleges, universities, professional schools and junior colleges
    "8221", # colleges, universities, and professional schools
    "8222", # junior colleges and technical institutes
    "824",  # vocational schools
    "8243", # data processing schools
    "8244", # business and secretarila schools
    "8249", # vocational schools, not elsewhere classified
    "829",  # schools and educational services, not elsewhere classified
    "8299"  # schools and educational services, not elsewhere classified
  ]

  class << self

    # Look up a Demandbase record for a given domain name.
    #
    # Returns a Demandbase::Record if the record is found; nil otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def lookup(domain)
      Demandbase::Record.new(domain)
    end

    # Ascertain whether the given query string is a valid IP address.
    #
    # Returns true if it's a valid IP address; false otherwise.
    def is_ip(query)
      !!(query =~ Resolv::IPv4::Regex)
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

    # Find out if a particular domain is associated with an academic institution.
    #
    # Returns true if it looks like an academic organization; false otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def is_academic?(domain)
      record = Demandbase::Record.new(domain)
      if record && ACADEMIC_SIC_CODES.include?(record.primary_sic)
        return true
      else
        return false
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