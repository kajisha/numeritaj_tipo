module NumeritajTipo
  class AttributeDefinition
    attr_reader :name, :default

    delegate :type, :enum_values, :values_for_validation, to: :@enum_type

    def initialize(name, values: nil, type: Symbol, default: nil, allow_nil: false)
      @name = name
      @enum_type = EnumType.new(type, values)
      @default = default
      @allow_nil = allow_nil
    end

    def build(target)
      define_enum! target

      define_helpers! target
      define_predicates! target
      define_scopes! target
    end

    private

    def pluralized_name
      name.to_s.pluralize
    end

    def define_enum!(target)
      target.define_enum name, type, default

      define_validation! target
    end

    def define_helpers!(target)
      return if target.respond_to?(pluralized_name)

      target.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def self.#{pluralized_name}
          #{enum_values}
        end
      RUBY
    end

    def define_predicates!(target)
      enum_values.each do |value|
        unless target.respond_to?("#{value}?")
          target.class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def #{value}?
              read_attribute(:#{name}) == :#{value}
            end
          RUBY
        end
      end
    end

    def define_scopes!(target)
      target.define_scopes self
    end

    def define_validation!(target)
      target.validates_inclusion_of name, in: values_for_validation,
        allow_nil: @allow_nil
    end
  end
end
