require 'neo4j'
require 'neo4j/shared/type_converters'
require 'neo4j/shared/typecaster'

module NumeritajTipo
  module Neo4j
    module TypeConverters
      class EnumConverter
        def self.converter_for(enum_class)
          return typecaster_for(enum_class) if typecaster_for(enum_class)

          converter_class = Class.new

          converter_class.extend(converter(enum_class))
            .include(::Neo4j::Shared::Typecaster)
        end

        private

        def self.typecaster_for(enum_class)
          ::Neo4j::Shared::TypeConverters.typecaster_for(enum_class)
        end

        def self.converter(enum_class)
          Module.new do |mod|
            mod.module_eval <<-RUBY
              def convert_type
                #{enum_class}
              end

              def db_type
                String
              end

              def to_db(value)
                value.to_s
              end

              def to_ruby(value)
                return value.value if value.respond_to?(:value)

                convert_type.build(value.to_sym)
              end

              alias_method :call, :to_ruby
            RUBY
          end
        end
      end
    end
  end
end
