require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'render index template' do
      expect(subject).to render_template(:index)
    end

    it 'return 200 code' do
      expect(response).to have_http_status(:ok)
    end
  end
end
