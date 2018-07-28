class CurrenciesController < ApplicationController
  def index
    @presenter = CurrencyPresenter.new(Currency.active)
  end
end
