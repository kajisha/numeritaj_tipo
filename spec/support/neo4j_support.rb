require 'neo4j'

Neo4j::Session.open(:server_db, 'http://localhost:7475')

class Neo4jUser
  include Neo4j::ActiveNode
  include NumeritajTipo::Neo4j

  property :name
  enumerize :role, values: %i(admin user), default: :user
  enumerize :payment_status, type: 'PaymentStatus', default: :pending
  enumerize :nullable, values: %i(some_value), allow_nil: true
end
