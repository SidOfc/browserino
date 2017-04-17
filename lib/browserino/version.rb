# frozen_string_literal: true
module Browserino
  VERSION = '4.0.0'.freeze

  def self.version
    @verion ||= Version.new VERSION.dup
  end

  # This class makes versions easily comparable using logical operators
  # it makes it convenient to check versions in a natural way
  class Version < Array
    attr_reader :major, :minor, :patch

    def initialize(val, *rest)
      super parse_params(val, *rest)
      @major = fetch 0, 0
      @minor = fetch 1, 0
      @patch = fetch 2, 0
    end

    def full
      to_s
    end

    def to_s
      @str ||= join '.'
    end

    def <(other)
      compare :<, other
    end

    def <=(other)
      compare :<=, other
    end

    def >(other)
      compare :>, other
    end

    def >=(other)
      compare :>=, other
    end

    def ==(other)
      compare :==, other
    end

    def !=(other)
      compare :!=, other
    end

    private

    def parse_params(val, *rest)
      case val
      when Float   then val.to_s.split '.'
      when Integer then [val, *rest]
      when String  then val.tr('_', '.').split '.'
      when Array   then val
      when Hash    then [val[:major], val[:minor], val[:patch]]
      else val.to_a
      end.map(&:to_i)
    end

    def compare(op, other)
      other = Version.new other unless other.is_a? Version

      return false if other.size > size

      subsize = [size, other.size].min
      (self[0...subsize] <=> other[0...subsize]).send op, 0
    end
  end
end
