require 'mongoid'

Mongoid.configure do |config|
  config.load_configuration({
    clients: {
      default: {
        database: 'mongoid_test',
        hosts: ['localhost:27017']
      }
    }
  })
end

class MongoUser
  include Mongoid::Document
  include NumeritajTipo::Mongoid

  field :name, type: String
  enumerize :role, values: %i(admin user), default: :user
  enumerize :payment_status, type: 'PaymentStatus', default: :pending
end

Mongoid.logger = Logger.new(nil)
Mongo::Logger.logger = Logger.new(nil)
