require 'rails_helper'

RSpec.describe Dealership do
  context 'relationships' do
    it { is_expected.to have_many :cars }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#to_s' do
    subject { build(:dealership) }

    it { expect(subject.to_s).to eq subject.name }
  end
end