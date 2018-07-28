module Currencies
  class Create
    include Interactor

    delegate :usd_value, to: :context

    def call
      # активной в единицу времени может быть только одна запись
      Currency.transaction do
        deactivate_previous
        activate_new
      end
    rescue StandardError => e
      context.fail!(message: e.message)
    end

    private

    def deactivate_previous
      active_currency = Currency.active
      return if active_currency.blank?
      active_currency.update!(active: false)
    end

    def activate_new
      Currency.create!(value: usd_value, active: true)
    end
  end
end
