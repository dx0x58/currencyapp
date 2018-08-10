shared_examples 'fill and check admin form for' do |action|
  context 'when valid params' do
    before do
      visit admin_root_path

      fill_in 'Value', with: currency.value
      fill_date_and_time(currency.expiration_date, from: :currency_expiration_date)

      click_on "#{action.capitalize} Currency"
    end

    let(:currency) { build :currency, expiration_date: 5.minutes.from_now }

    it 'success message visible' do
      expect(page).to have_content I18n.t('ui.save_success')
    end

    it 'value existing on form' do
      expect(page).to have_field('Value', with: currency.value)
    end
  end

  context 'when invalid params' do
    before do
      visit admin_root_path

      fill_in 'Value', with: currency.value
      fill_date_and_time(currency.expiration_date, from: :currency_expiration_date)

      click_on "#{action.capitalize} Currency"
    end

    let(:currency) { build :currency, value: value, expiration_date: 5.minutes.from_now }

    context 'with large value' do
      let(:value) { 5_555_555_555 }

      it 'failure message visible' do
        expect(page).to have_content I18n.t('ui.save_failure')
      end
    end

    context 'with negative value' do
      let(:value) { -100 }

      it 'failure message visible' do
        expect(page).to have_content I18n.t('ui.save_failure')
      end
    end

    context 'with text value' do
      let(:value) { 'not_a_number' }

      it 'text value convert to 0.0' do
        expect(page).to have_content I18n.t('ui.save_success')
      end
    end
  end
end
