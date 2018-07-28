module Currencies
  class Create
    include Interactor

    delegate :usd_value, to: :context

    def call
      # активной в единицу времени может быть только одна запись
      Currency.transaction do
        deactivate_all
        create_and_activate
      end
    rescue StandardError => e
      context.fail!(message: e.message)
    end

    private

    def deactivate_all
      # использование update! в цикле вместо update_all для возможности кинуть исключение внутри транзакции
      Currency.active.find_each { |currency_item| currency_item.update!(active: false) }
    end

    def create_and_activate
      Currency.create!(value: usd_value, active: true)
    end
  end
end
