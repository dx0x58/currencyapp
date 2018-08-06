require 'rails_helper'

describe Currencies::Update do
  subject(:context) { described_class.call(currency_id: forced_currency.id, params: params) }

  let!(:forced_currency) { create :currency }

  context 'when params is valid' do
    let(:params) { { value: 33.33, expiration_date: 5.minutes.from_now } }

    it 'return success result' do
      expect(context).to be_success
    end

    it 'update currency value' do
      context
      expect(forced_currency.reload.value).to eq params[:value]
    end

    it 'update currency expiration_date' do
      context
      expect(forced_currency.reload.expiration_date.to_s).to eq params[:expiration_date].to_s
    end

    it 'call notify service' do
      expect(Currencies::Notify).to receive(:call).with(value: params[:value])
      context
    end
  end

  context 'when params is invalid' do
    let(:params) { { value: 'not_a_number', expiration_date: 'some_string' } }

    it 'return failure result' do
      expect(context).to be_failure
    end

    it 'not update currency value' do
      context
      expect(forced_currency.reload.value).to eq forced_currency.value
    end

    it 'not update currency expiration_date' do
      context
      expect(forced_currency.reload.expiration_date.to_s).to eq forced_currency.expiration_date.to_s
    end

    it 'not call notify service' do
      expect(Currencies::Notify).not_to receive(:call).with(value: params[:value])
      context
    end
  end
end
