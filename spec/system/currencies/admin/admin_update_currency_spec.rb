require 'rails_helper'

describe 'Admin update currency' do
  let(:currency_value) { 11.22 }
  before { create :currency, :forced, value: currency_value }

  it_behaves_like 'fill and check admin form for', 'update'

  context 'multiple session' do
    let(:currency) { build :currency, expiration_date: 5.minutes.from_now }

    it 'currency value appear on home page', js: true do
      Capybara.using_session('guest') do
        visit root_path
        expect(page).to have_content currency_value
      end

      Capybara.using_session('admin') do
        visit admin_root_path
        fill_in 'Value', with: currency.value
        fill_date_and_time(currency.expiration_date, from: :currency_expiration_date)

        click_on 'Update Currency'
      end

      Capybara.using_session('guest') do
        expect(page).to have_content currency.value
      end
    end
  end
end
