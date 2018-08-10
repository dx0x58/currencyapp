require 'rails_helper'

describe 'Admin create currency' do
  it_behaves_like 'fill and check admin form for', 'create'

  context 'multiple session' do
    let(:currency) { build :currency, expiration_date: 5.minutes.from_now }

    it 'currency value appear on home page', js: true do
      Capybara.using_session('guest') do
        visit root_path
        expect(page).to have_content I18n.t('ui.currency_not_exist')
      end

      Capybara.using_session('admin') do
        visit admin_root_path
        fill_in 'Value', with: currency.value
        fill_date_and_time(currency.expiration_date, from: :currency_expiration_date)

        click_on 'Create Currency'
      end

      Capybara.using_session('guest') do
        expect(page).to have_content currency.value
      end
    end
  end
end
