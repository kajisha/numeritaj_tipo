require 'numeritaj_tipo/base'

module NumeritajTipo
  module Mongoid
    include NumeritajTipo::Base

    def self.included(base)
      base.extend self
    end

    def define_enum(attribute_name, type, default_value)
      type_class = type.to_s.classify.constantize
      type_class = type_class.extend(Mongoize) if type_class < NumeritajTipo::EnumBase
      field attribute_name, type: type_class, default: type < NumeritajTipo::EnumBase ? type.build(default_value) : default_value
    end

    def define_scopes(attribute_definition)
      attribute_definition.enum_values.each do |value|
        scope value, -> { where(attribute_definition.name => value) }
      end
    end

    module Mongoize
      def mongoize(object)
        build(object)
      end
    end
  end
end
