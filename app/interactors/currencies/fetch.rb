module Currencies
  class Fetch
    include Interactor

    CURRENCY_URI = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

    def call
      context.usd_value = parse_value(xml_data)
    rescue StandardError => e
      context.fail!(message: e.message)
    end

    private

    def xml_data
      HTTP.get(CURRENCY_URI)
    end

    def parse_value(body)
      usd_item = Hash.from_xml(body).dig('ValCurs', 'Valute').find { |item| item['CharCode'] == 'USD' }
      usd_item['Value'].tr!(',', '.').to_f
    end
  end
end
