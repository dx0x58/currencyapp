require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }

    it { expect(response).to have_http_status(:ok) }

    context 'when active currency' do
      context 'with existing active currency' do
        let!(:active_currency) { create :currency, :active }

        before { get :index }

        it 'assigns active currency' do
          expect(assigns[:currency]).to eq active_currency
        end
      end

      context 'without existing active currency' do
        before { get :index }

        it 'assigns active currency' do
          expect(assigns[:currency]).to be_nil
        end
      end
    end

    context 'when forced currency exist' do
      let!(:forced_currency) { create :currency, :forced }

      before { get :index }

      it 'assigns forced currency' do
        expect(assigns[:currency]).to eq forced_currency
      end
    end
  end
end
