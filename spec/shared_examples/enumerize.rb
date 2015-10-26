RSpec.shared_examples 'enumerize' do
  describe '.enumerize' do
    specify do
      expect(model.role).to eq(:user)
      expect(model.payment_status.to_sym).to eq(:pending)

      model.save!
      model.reload

      expect(model.role).to eq(:user)
      expect(model.payment_status.to_sym).to eq(:pending)
    end
  end

  describe 'predicate method' do
    it { expect(model).to be_user }
    it { expect(model).not_to be_admin }
    it { expect(model).to be_pending }
    it { expect(model).not_to be_approved }
    it { expect(model).not_to be_declined }
  end

  describe 'helper method' do
    it { expect(model.class.roles).to eq(%i(admin user)) }
    it { expect(model.class.payment_statuses).to match(%i(pending approved declined)) }
  end
end
