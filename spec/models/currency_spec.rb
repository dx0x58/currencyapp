require 'rails_helper'

describe Currency do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to allow_value(111.2222).for(:value) }
  end

  describe 'scopes' do
    describe '.active' do
      let!(:active_currency) { create :currency, :active }

      it 'return active currency' do
        expect(described_class.active).to eq active_currency
      end
    end

    describe '.forced' do
      let!(:forced_currency) { create :currency, :forced }

      it 'return active currency' do
        expect(described_class.forced).to eq forced_currency
      end
    end
  end
end
