module Demandbase

  # The base error class for all Demandbase error classes.
  class Error < StandardError
  end

  # Raised when the query string doesn't look like a domain
  class ParseError < Error
  end

  class RTIDNotSetError < Error
  end

  # Raised when there's a problem communicating with the Demandbase server.
  class ServerError < Error
  end

end