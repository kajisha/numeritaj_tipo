require 'active_support'
require 'active_support/core_ext/class/subclasses'

module NumeritajTipo
  class EnumBase
    include Comparable

    attr_reader :value

    class << self
      def build(value)
        return value.value if value.respond_to?(:value)

        subclasses.find {|subclass| subclass.new.value == value }.new
      end

      def values
        subclasses.map {|subclass| subclass.new.value }
      end
    end

    def ==(other)
      self.value == other
    end

    def to_s
      value.to_s
    end

    def to_sym
      value
    end
    alias :intern :to_sym
  end
end
