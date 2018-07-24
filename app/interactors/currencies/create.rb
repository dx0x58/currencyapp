module Currencies
  class Create
    include Interactor

    delegate :usd_value, to: :context

    def call
      Currency.create!(value: usd_value)
    rescue StandardError => e
      context.fail!(message: e.message)
    end
  end
end
