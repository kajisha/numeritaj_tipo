require 'active_record/type/value'

module NumeritajTipo
  module ActiveRecord
    module Type
      class EnumType < ::ActiveRecord::Type::Value
        def initialize(enum_class)
          @enum_class = enum_class
        end

        def type
          @enum_class
        end

        def type_cast_for_database(value)
          value.to_s
        end

        private

        def type_cast(value)
          return nil if value.nil?

          @enum_class.build(value.to_sym)
        end
      end
    end
  end
end
