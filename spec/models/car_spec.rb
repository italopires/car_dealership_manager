require 'rails_helper'

RSpec.describe Car do
  context 'relationships' do
    it { is_expected.to belong_to(:dealership)}
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :dealership_id }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :status }
  end
  
  context 'enumerizeds' do
    it { is_expected.to enumerize(:status).in(new: 1, used: 2) }
  end
end