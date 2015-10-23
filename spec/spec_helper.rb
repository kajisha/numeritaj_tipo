$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir['spec/support/**/*'].each {|f| require f }

require 'numeritaj_tipo'
