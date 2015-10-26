require 'numeritaj_tipo/base'
require 'numeritaj_tipo/active_record/type/enum_type'
require 'numeritaj_tipo/active_record/type/symbol_type'

module NumeritajTipo
  module ActiveRecord
    include NumeritajTipo::Base

    def self.included(base)
      base.extend self
    end

    def define_enum(attribute_name, type, default_value = nil)
      attribute(attribute_name, NumeritajTipo::ActiveRecord::Type::SymbolType.new) if type == Symbol
      attribute(attribute_name, NumeritajTipo::ActiveRecord::Type::EnumType.new(type)) if type < NumeritajTipo::EnumBase

      if default_value
        after_initialize do
          write_attribute attribute_name, type < NumeritajTipo::EnumBase ? type.build(default_value) : default_value
        end
      end
    end

    def define_scopes(attribute_definition)
      attribute_definition.enum_values.each do |value|
        scope value, -> { where(attribute_definition.name => value) }
      end
    end
  end
end
