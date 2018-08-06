require 'rails_helper'

describe Admin::CurrenciesController do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }

    it { expect(response).to have_http_status(:ok) }

    context 'when forced item existing' do
      let!(:forced_currency) { create :currency, :forced }

      before { get :index }

      it 'assign existing currency' do
        expect(assigns[:currency]).to eq forced_currency
      end
    end

    context 'when forced not existing' do
      before { get :index }

      it 'assign new currency' do
        expect(assigns[:currency]).to be_a_new(Currency)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'create new forced currency ' do
        expect { post :create, params: { currency: attributes_for(:currency, :forced) } }
          .to change(Currency, :count).by(1)
      end

      it 'redirect to admin page' do
        post :create, params: { currency: attributes_for(:currency, :forced) }
        expect(response).to redirect_to(:admin_root)
      end

      it 'set success flash message' do
        post :create, params: { currency: attributes_for(:currency, :forced) }
        expect(flash[:notice]).to eq I18n.t('ui.save_success')
      end
    end

    context 'with invalid params' do
      it 'not create new forced currency ' do
        expect { post :create, params: { currency: attributes_for(:invalid_currency) } }
          .not_to change(Currency, :count)
      end

      it 'render admin page' do
        post :create, params: { currency: attributes_for(:invalid_currency) }
        expect(response).to render_template(:index)
      end

      it 'set failure flash message' do
        post :create, params: { currency: attributes_for(:invalid_currency) }
        expect(flash[:alert]).to eq I18n.t('ui.save_failure')
      end
    end
  end

  describe 'PATCH #update' do
    let!(:forced_currency) { create :currency, :forced }

    context 'with valid params' do
      let(:new_currency_params) { { value: 11.22, expiration_date: 5.minutes.from_now } }

      before { patch :update, params: { id: forced_currency.id, currency: new_currency_params } }

      it 'update currency value' do
        expect(forced_currency.reload.value).to eq new_currency_params[:value]
      end
      it 'update currency expiration_date' do
        expect(forced_currency.reload.expiration_date.to_s).to eq new_currency_params[:expiration_date].to_s
      end

      it 'redirect to admin page' do
        expect(response).to redirect_to(:admin_root)
      end

      it 'set success flash message' do
        expect(flash[:notice]).to eq I18n.t('ui.save_success')
      end
    end

    context 'with invalid params' do
      before { patch :update, params: { id: forced_currency.id, currency: attributes_for(:invalid_currency) } }

      it 'currency value has old value' do
        expect(forced_currency.reload.value).to eq forced_currency.value
      end

      it 'currency expiration_date has old value' do
        expect(forced_currency.reload.expiration_date.to_s).to eq forced_currency.expiration_date.to_s
      end

      it 'render admin page' do
        expect(response).to render_template(:index)
      end

      it 'set failure flash message' do
        expect(flash[:alert]).to eq I18n.t('ui.save_failure')
      end
    end
  end
end
