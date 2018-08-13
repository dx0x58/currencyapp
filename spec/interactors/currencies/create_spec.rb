require 'rails_helper'

describe Currencies::Create do
  describe '.call' do
    subject(:context) { described_class.call(params: params) }

    context 'when params is valid' do
      let(:params) { { value: 54.25 } }

      it { is_expected.to be_success }

      it 'create one currency' do
        expect { context }.to change(Currency, :count).by(1)
      end

      it 'created with correct value' do
        context
        expect(Currency.last.value).to eq params[:value]
      end

      it 'created with correct "active" attribute' do
        context
        expect(Currency.last.active).to be_truthy
      end

      context 'when active item alredy exist' do
        let!(:currency_old_active) { create :currency, :active }

        before { context }

        it 'disactivate old "active" item' do
          expect(currency_old_active.reload.active).to be_falsey
        end

        it 'only one is active' do
          expect(Currency.last.active).to be_truthy
        end
      end

      context 'when forced item' do
        let!(:forced_currency) { create :currency, :forced }

        context 'with time not expired' do
          before { context }

          it 'not create new not-active currency' do
            expect(Currency.last.active).to be_truthy
          end

          it 'keep active old forced currency' do
            expect(forced_currency.reload.active).to be_truthy
          end
        end

        context 'with time was expired' do
          before do
            Timecop.freeze(2.hours.from_now)
            context
          end

          after { Timecop.return }

          it 'forced currency set as not-active' do
            expect(forced_currency.reload.active).to be_falsey
          end

          it 'create new active currency' do
            expect(Currency.last.active).to be_truthy
          end
        end
      end

      it 'call notify service' do
        expect(Currencies::Notify).to receive(:call).with(value: params[:value])
        context
      end
    end

    context 'when params is invalid' do
      context 'when too high value' do
        let(:params) { { value: 545_454.25 } }

        it { is_expected.to be_failure }

        it 'do not create currency' do
          expect { context }.not_to change(Currency, :count)
        end

        it 'not call notify service' do
          expect(Currencies::Notify).not_to receive(:call).with(value: params[:value])
          context
        end
      end

      context 'when numerical value' do
        let(:params) { { value: 'not_a_number' } }

        it { is_expected.to be_failure }

        it 'do not create currency' do
          expect { context }.not_to change(Currency, :count)
        end
      end
    end
  end
end
