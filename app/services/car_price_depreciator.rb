class CarPriceDepreciator
  def self.execute
    Car.transaction do
      Car.find_each(batch_size: 1000) do |car|
        car.update!(price: (car.price * 0.98).round(2))
      end
    end
  end
end