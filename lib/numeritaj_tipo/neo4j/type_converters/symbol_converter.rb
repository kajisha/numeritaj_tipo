require 'neo4j'
require 'neo4j/shared/type_converters'
require 'neo4j/shared/typecaster'

module NumeritajTipo
  module Neo4j
    module TypeConverters
      class SymbolConverter
        class << self
          def premitive_type
            Symbol
          end

          def convert_type
            Symbol
          end

          def db_type
            String
          end

          def to_db(value)
            value.to_s
          end

          def to_ruby(value)
            value.to_sym
          end

          alias_method :call, :to_ruby
        end

        include ::Neo4j::Shared::Typecaster
      end
    end
  end
end
