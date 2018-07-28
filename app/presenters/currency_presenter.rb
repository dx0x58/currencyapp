class CurrencyPresenter
  RUB_SIGN = '₽'.freeze

  attr_reader :currency

  def initialize(currency)
    @currency = currency
  end

  def rub_value
    "#{currency.value} #{RUB_SIGN}"
  end
end
