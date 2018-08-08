require 'rails_helper'

describe 'User view currency home page' do
  it 'view header' do
    visit root_path
    expect(page).to have_content I18n.t('ui.currency_header')
  end

  context 'when active currency exist' do
    let!(:currency) { create :currency, :active }

    it 'view currency value' do
      visit root_path
      expect(page).to have_content currency.value
    end
  end

  context 'when active currency not exist' do
    it 'view default label' do
      visit root_path
      expect(page).to have_content I18n.t('ui.currency_not_exist')
    end
  end
end
