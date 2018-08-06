module Currencies
  class Notify
    include Interactor

    def call
      ActionCable.server.broadcast('currency', value: context.value)
    end
  end
end
