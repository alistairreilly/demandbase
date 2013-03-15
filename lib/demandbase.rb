require 'json'
require 'public_suffix'
require 'rest_client'

require 'demandbase/record'

module Demandbase
   class << self
    def lookup_domain(domain)
      'Stanford University'
    end

    def lookup_ip(ip)
      'Stanford University'
    end

    def lookup(domain_or_ip)
      'Stanford University'
    end
  end
end