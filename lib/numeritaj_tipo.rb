require 'active_support'
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
end
