RSpec.shared_examples 'scope' do
  describe '.scope' do
    specify do
      model.save!

      expect(model.class.user.count).to eq(1)
      expect(model.class.admin.count).to eq(0)

      expect(model.class.pending.count).to eq(1)
      expect(model.class.approved.count).to eq(0)
      expect(model.class.declined.count).to eq(0)
    end
  end
end
