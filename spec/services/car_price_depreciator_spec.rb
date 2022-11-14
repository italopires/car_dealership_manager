require 'rails_helper'

RSpec.describe CarPriceDepreciator do
  describe '.execute' do
    let!(:car1) { create(:car, price: 4.5) }
    let!(:car2) { create(:car, price: 4.5) }
    let!(:car3) { create(:car, price: 4.5) }

    it 'depreciates the price in 2%', aggregate_failures: true do
      described_class.execute
      car1.reload
      car2.reload
      car3.reload

      expect(car1.price).to eq 4.41
      expect(car2.price).to eq 4.41
      expect(car3.price).to eq 4.41
    end
  end
end