module Admin
  class CurrenciesController < ApplicationController
    def index
      @currency = Currency.forced || Currency.new
    end

    def create
      result = Currencies::Create.call(params: currency_params, active: true)
      @currency = result.currency
      redirect_or_render(result)
    end

    def update
      result = Currencies::Update.call(currency_id: params[:id], params: currency_params)
      @currency = result.currency
      redirect_or_render(result)
    end

    private

    def currency_params
      params.require(:currency).permit(:value, :expiration_date)
    end

    def redirect_or_render(result)
      if result.success?
        flash[:notice] = I18n.t('ui.save_success')
        redirect_to :admin_root
      else
        flash.now[:alert] = I18n.t('ui.save_failure')
        render :index
      end
    end
  end
end
