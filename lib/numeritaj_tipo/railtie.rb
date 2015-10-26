require 'rails/railtie'

module NumeritajTipo
  class Railtie < ::Rails::Railtie
    initializer 'numeritaj_tipo.autoload', before: :set_autoload_paths do |app|
      app.config.autoload_paths << app.root.join('app/enums')
    end
  end
end
