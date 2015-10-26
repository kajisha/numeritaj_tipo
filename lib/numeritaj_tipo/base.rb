module NumeritajTipo
  module Base
    def enumerize(attribute_name, options = {})
      AttributeDefinition.new(attribute_name, options).build(self)
    end
  end
end
