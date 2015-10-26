module NumeritajTipo
  class EnumType
    attr_reader :type, :enum_values

    def initialize(type, values)
      @type = type.to_s.classify.constantize
      @enum_values = @type < NumeritajTipo::EnumBase ? @type.values : values
    end

    def values_for_validation
      return enum_values unless type < NumeritajTipo::EnumBase

      enum_values.map {|value| type.build(value) }
    end
  end
end
