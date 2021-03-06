require 'rails_helper'

describe Currencies::Fetch do
  describe '.call' do
    subject(:context) { described_class.call }

    let(:usd_value_string) { '555,12' }
    let(:usd_value_float) { usd_value_string.tr!(',', '.').to_f }

    before do
      xml = Rails.root.join('spec', 'fixtures', 'cbr_currency_response.xml').read
      xml.gsub!('%usd_value%', usd_value_string)
      stub_request(:get, 'http://www.cbr.ru/scripts/XML_daily.asp')
        .to_return(status: 200, body: xml)
    end

    context 'when response is correct' do
      it { is_expected.to be_success }

      it 'fetch correct value' do
        expect(context.params[:value]).to eq usd_value_float
      end
    end

    context 'when response is incorrect' do
      before do
        stub_request(:get, 'http://www.cbr.ru/scripts/XML_daily.asp')
          .to_return(status: 502, body: '')
      end

      it { is_expected.to be_failure }
    end
  end
end
