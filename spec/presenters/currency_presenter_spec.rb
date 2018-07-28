require 'rails_helper'

describe CurrencyPresenter do
  subject(:presenter) { described_class.new(currency) }

  let(:currency) { build :currency, :active }
  let(:currency_value) { currency.value }

  describe '#rub_value' do
    it 'return value with rub sign' do
      expect(presenter.rub_value).to eq "#{currency_value} ₽"
    end
  end
end
