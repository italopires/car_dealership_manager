namespace :car do
  desc "DEPRECIATE PRICES"
  task depreciate_price: :environment do
    CarPriceDepreciator.execute
  end
end
