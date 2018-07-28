class CurrencyPresenter
  attr_reader :currency

  def initialize(currency)
    @currency = currency
  end

  def rub_value
    "#{currency.value} ₽"
  end
end
