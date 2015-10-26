RSpec.describe 'ActiveRecord' do
  let(:model) { AR::User.new }

  it_behaves_like 'enumerize'
  it_behaves_like 'scope'
end
