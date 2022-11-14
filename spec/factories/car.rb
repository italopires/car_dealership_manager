FactoryBot.define do
  factory :car do
    name { FFaker::Name.name }
    price { rand(11.2...76.9) }
    dealership
    status { Car.status.values.sample }
  end
end