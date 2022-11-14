FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    kind { User.kind.values.sample }
    password { "useR123*" }
  end
end