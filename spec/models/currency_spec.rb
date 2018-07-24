require 'rails_helper'

describe Currency do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to allow_value(111.2222).for(:value) }
  end
end
