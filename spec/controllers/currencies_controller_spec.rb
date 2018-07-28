require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }

    it 'return 200 code' do
      expect(response).to have_http_status(:ok)
    end
  end
end
