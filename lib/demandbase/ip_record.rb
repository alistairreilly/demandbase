module Demandbase
  class IPRecord < Demandbase::Record
    attr_accessor :ip
    attr_accessor :audience
    attr_accessor :audience_segment
    attr_accessor :information_level
    attr_accessor :worldhq_sid
    attr_accessor :domestichq_sid
    attr_accessor :hq_sid
    attr_accessor :isp
  end
end