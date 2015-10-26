RSpec.describe 'Mongoid' do
  let(:model) { MongoUser.new }

  it_behaves_like 'enumerize'
  it_behaves_like 'scope'
end
