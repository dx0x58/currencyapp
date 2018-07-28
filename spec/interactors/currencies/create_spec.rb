require 'rails_helper'

describe Currencies::Create do
  describe '.call' do
    subject(:context) { described_class.call(usd_value: usd_value) }

    context 'when params is valid' do
      let(:usd_value) { 54.25 }

      it 'success result' do
        expect(context).to be_success
      end

      it 'create one currency' do
        expect { context }.to change(Currency, :count).by(1)
      end

      it 'created with correct value' do
        context
        currency = Currency.last
        expect(currency.value).to eq usd_value
      end

      it 'created with correct "active" attribute' do
        context
        currency = Currency.last
        expect(currency.active).to be_truthy
      end

      context 'when active item alredy exist' do
        let!(:currency_old_active) { create :currency, :active }

        it 'only one is active' do
          context
          created_currency = Currency.last
          expect(currency_old_active.reload.active).to be_falsey
          expect(created_currency.active).to be_truthy
        end
      end
    end

    context 'when params is invalid' do
      context 'when too high value' do
        let(:usd_value) { 545_454.25 }

        it 'failure result' do
          expect(context).to be_failure
        end

        it 'do not create currency' do
          expect { context }.not_to change(Currency, :count)
        end
      end

      context 'when numerical value' do
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
end
