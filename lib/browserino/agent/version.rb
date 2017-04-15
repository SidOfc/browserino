# frozen_string_literal: true
module Browserino
  class Agent
    class Version
      attr_reader :major, :minor, :patch, :full

      def initialize(val, *rest)
        results = parse_val val, *rest
        @major  = results.fetch 0, 0
        @minor  = results.fetch 1, 0
        @patch  = results.fetch 2, 0
        @full ||= to_a.join '.'
      end

      def to_s
        full
      end

      def to_a
        @components ||= [@major, @minor, @patch]
      end

      def to_i
        @num = to_a.join.to_i
      end

      def <(other)
        compare :<, other
      end

      def >(other)
        compare :>, other
      end

      def <=(other)
        compare :<=, other
      end

      def >=(other)
        compare :>=, other
      end

      def !=(other)
        compare :!=, other
      end

      def ==(other)
        compare :==, other
      end

      def parse_val(val, *rest)
        case val
        when Float   then val.to_s.split '.'
        when Integer then [val, *rest]
        when String  then val.tr('_', '.').split '.'
        when Array   then val
        when Hash    then [val[:major], val[:minor], val[:patch]]
        else val.to_a
        end.map(&:to_i)
      end

      private

      def compare(op, other)
        other    = Version.new(other) unless other.is_a? Version
        size     = [to_a.size, other.to_a.size].min
        to_a[0...size].join.to_i.send op, other.to_a[0..size].join.to_i
      end
    end
  end
end
