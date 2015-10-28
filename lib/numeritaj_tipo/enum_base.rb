module NumeritajTipo
  class EnumBase
    class << self
      def build(other)
        values.find {|value| value == other.to_sym }
      end
    end
  end
end
