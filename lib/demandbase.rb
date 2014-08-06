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

  # SIC codes for government.
  GOVERNMENT_SIC_CODES = [
    "91",   # executive, legislative, and general government, except finance
    "911",  # executive offices
    "9111", # executive offices
    "912",  # legislative bodies
    "9121", # legislative bodies
    "913",  # executive and legislative offices combined
    "9131", # executive and legislative offices combined
    "919",  # general government, not elsewhere classified
    "9199", # general government, not elsewhere classified
    "92",   # justice, public order, and safety
    "921",  # courts
    "9211", # courts
    "922",  # public order and safety
    "9221", # police protection
    "9222", # legal counsel and prosecution
    "9223", # correctional institutions
    "9224", # fire protection
    "9229", # public order and safety, not elsewhere classified
    "93",   # public finance, taxation, and monetary policy
    "931",  # public finance, taxation, and monetary policy
    "9311", # public finance, taxation, and monetary policy
    "94",   # administration of human resource programs
    "941",  # administration of educational programs
    "9411", # administration of educational programs
    "943",  # administration of public health programs
    "9431", # administration of educational programs
    "944",  # administration of social, human resource and income maintenance programs
    "9441", # administration of social, human resource and income maintenance prorgrams
    "945",  # administration of veterans' affairs, except health and insurance
    "9451", # administration of veterans' affairs, except health and insurance
    "95",   # administration of environmental quality and housing programs
    "951",  # administration of environmental quality programs
    "9511", # air and water resource and solid waste management
    "9512", # land, mineral, wildlife, and forest conservation
    "953",  # administration of housing and urban development progr
    "9531", # administration of housing programs
    "9532", # administration of urban planning and community and rural development
    "96",   # administration of economic programs
    "961",  # administration of general economic programs
    "9611", # administration of general economic programs
    "962",  # regulation and administration of transportation programs
    "9621", # regulation and administration of transportation programs
    "963",  # regulation and administration of communications, electric, gas, and other utilities
    "9631", # regulation and administration of communications, electric, gas, and other utilities
    "964",  # regulation of agricultural marketing and commodities
    "9641", # regulation of agricultural marketing and commodities
    "965",  # regulation, licensing, and inspection of miscellaneous commercial
    "9561", # regulation, licensing, and inspection of miscellaneous commercial
    "966",  # space research and technology
    "9661", # space research and technology
    "977",  # national security and international affairs
    "971",  # national security
    "9711", # national security
    "972",  # international affairs
    "9721"  # international affairs
  ]

  # SIC codes for registered nonprofits.
  NONPROFIT_SIC_CODES = [
    "6732", # Educational, religious, and charitable Trusts
    "864",  # Civic, social, and fraternal associations
    "8641", # Civic, social, and fraternal associations
    "865",  # Political organizations
    "8651", # Political organizations
    "866",  # Religious organizations
    "8661", # Religious organizations
    "869",  # Membership organizations, not elsewhere classified
    "8699"  # Membership organizations, not elsewhere classified
  ]

  class << self

    def lookup_ip(query)
      Demandbase::IPRecord.new(query)
    end
    alias_method :lookup_ip_address, :lookup_ip

    def lookup_domain(query)
      Demandbase::DomainRecord.new(query)
    end
    alias_method :lookup_domain_name, :lookup_domain

    # Look up a Demandbase record for a given domain name.
    #
    # Returns a Demandbase::Record if the record is found; nil otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def lookup(query)
      if Demandbase::IPRecord.is_ip(query)
        Demandbase::IPRecord.new(query)
      elsif Demandbase::DomainRecord.is_domain(query)
        Demandbase::DomainRecord.new(query)
      else
        raise Demandbase::ParseError
      end
    end
    alias_method :lazy_lookup, :lookup

    # Find out if a particular domain is associated with an academic institution.
    #
    # Returns true if it looks like an academic organization; false otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def is_academic?(domain)
      record = Demandbase::DomainRecord.new(domain)

      if record && ACADEMIC_SIC_CODES.include?(record.primary_sic)
        return true
      else
        return false
      end
    end

    # Find out if a particular domain is associated with a government agency.
    #
    # Returns true if it looks like an government agency; false otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def is_government?(domain)
      record = Demandbase::DomainRecord.new(domain)

      if record && GOVERNMENT_SIC_CODES.include?(record.primary_sic)
        return true
      else
        return false
      end
    end

    # Find out if a particular domain is associated with a nonprofit.
    #
    # Returns true if it looks like a nonprofit; false otherwise.
    #
    # Raises a Demandbase::RTIDNotSetError if a RTID key is not set.
    # Raises a Demandbase::ParseError if the domain doesn't look legit.
    # Raises a Demandbase::ServerError if the Demandbase server is unresponsive.
    #
    def is_nonprofit?(domain)
      record = Demandbase::DomainRecord.new(domain)

      if record && NONPROFIT_SIC_CODES.include?(record.primary_sic)
        return true
      else
        return false
      end
    end
  end
end
