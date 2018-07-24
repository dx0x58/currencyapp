require 'rails_helper'

describe Currencies::Create do
  subject(:context) { described_class.call(usd_value: usd_value) }

  context 'when params is valid' do
    let(:usd_value) { 54.25 }

    it 'success result' do
      expect(context).to be_success
    end

    it 'create currency' do
      expect { context }.to change(Currency, :count).by(1)
    end

    it 'created with correct value' do
      context
      currency = Currency.last
      expect(currency.value).to eq usd_value
    end
  end

  context 'when params is invalid' do
    context 'when usd_value contain too high value' do
      let(:usd_value) { 545_454.25 }

      it 'failure result' do
        expect(context).to be_failure
      end

      it 'do not create currency' do
        expect { context }.not_to change(Currency, :count)
      end
    end

    context 'when usd_value contain not a numerical value' do
      let(:usd_value) { 'not_a_number' }

      it 'failure result' do
        expect(context).to be_failure
      end

      it 'do not create currency' do
        expect { context }.not_to change(Currency, :count)
      end
    end
  end
end
