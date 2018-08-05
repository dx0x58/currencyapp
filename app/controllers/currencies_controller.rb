class CurrenciesController < ApplicationController
  def index
    @presenter = CurrencyPresenter.new(currency) if currency.present?
  end

  private

  def currency
    @currency ||= Currency.active
  end
end
