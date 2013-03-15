require 'json'
require 'public_suffix'
require 'rest_client'

require 'demandbase/error'
require 'demandbase/record'

module Demandbase
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
  end
end