RSpec.describe 'Neo4j' do
  let(:model) { Neo4jUser.new }

  it_behaves_like 'enumerize'
  it_behaves_like 'scope'
end
