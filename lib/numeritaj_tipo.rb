require 'active_support'
require 'active_support/inflector'
require 'numeritaj_tipo/version'
require 'numeritaj_tipo/railtie' if defined?(Rails)

module NumeritajTipo
  extend ActiveSupport::Autoload

  autoload :AttributeDefinition
  autoload :Base
  autoload :EnumBase
  autoload :EnumType

  autoload :ActiveRecord
  autoload :Mongoid
  autoload :Neo4j

  def define_enum(enum, values)
    Object.const_set enum, Class.new(EnumBase)

    enum_type = enum.to_s.constantize
    enum_type.cattr_accessor :values
    enum_type.values = values
  end
  module_function :define_enum
end
