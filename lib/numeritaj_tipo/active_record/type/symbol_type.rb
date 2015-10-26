require 'active_record/type/value'

module NumeritajTipo
  module ActiveRecord
    module Type
      class SymbolType < ::ActiveRecord::Type::Value
        def type
          :symbol
        end

        def type_cast_for_database(value)
          value.to_s
        end

        private

        def type_cast(value)
          return nil if value.nil?

          value.to_sym
        end
      end
    end
  end
end
