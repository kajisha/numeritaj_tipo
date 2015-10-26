require 'active_record'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Base.connection.instance_eval do
  create_table :users do |t|
    t.string :name
    t.string :role, null: false
    t.string :payment_status, null: false
  end
end

module AR
  class User < ActiveRecord::Base
    self.table_name = :users

    include NumeritajTipo::ActiveRecord

    enumerize :role, values: %i(admin user), type: Symbol, default: :user
    enumerize :payment_status, type: 'PaymentStatus', default: :pending
  end
end
