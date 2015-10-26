require 'numeritaj_tipo/base'
require 'numeritaj_tipo/neo4j/type_converters/enum_converter'
require 'numeritaj_tipo/neo4j/type_converters/symbol_converter'

module NumeritajTipo
  module Neo4j
    include NumeritajTipo::Base

    def self.included(base)
      base.extend self
    end

    def define_enum(attribute_name, type, default_value)
      property_options = {type: type, default: type < NumeritajTipo::EnumBase ? type.build(default_value) : default_value}
      property_options.merge!(typecaster: NumeritajTipo::Neo4j::TypeConverters::SymbolConverter) if type == Symbol
      property_options.merge!(typecaster: NumeritajTipo::Neo4j::TypeConverters::EnumConverter.converter_for(type)) if type < NumeritajTipo::EnumBase

      property attribute_name, property_options
    end

    def define_scopes(attribute_definition)
      attribute_definition.enum_values.each do |value|
        scope value, -> { where(attribute_definition.name => value) }
      end
    end
  end
end
