module Currencies
  class Create
    include Interactor

    delegate :params, :active, to: :context

    def call
      context.fail!(message: 'not allowed to activate') unless allowed_activate?

      Currency.transaction do
        deactivate_previous
        create
        notify
      end
    end

    private

    def deactivate_previous
      Currency.active.try(:update!, active: false)
    end

    def create
      currency = Currency.create(params.merge!(active: allowed_activate?))
      context.currency = currency
      context.fail!(message: currency.errors.full_messages) unless currency.persisted?
    end

    def allowed_activate?
      # status passed as argument
      return active if active.present?

      # forced items not exists
      expiration_date = Currency.forced.try(:expiration_date)
      return true if expiration_date.blank?

      expiration_date < Time.current
    end

    def notify
      Currencies::Notify.call(value: context.currency.value)
    end
  end
end
