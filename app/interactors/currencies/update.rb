module Currencies
  class Update
    include Interactor

    def call
      currency = Currency.find(context.currency_id)
      context.currency = currency

      currency.update!(context.params)

      Currencies::Notify.call(value: context.params[:value])
    rescue ActiveRecord::RecordInvalid => e
      context.fail!(message: e.message)
    end
  end
end
