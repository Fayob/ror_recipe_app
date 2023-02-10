FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test-#{n.to_s.rjust(3, '0')}john" }
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password { '123456' }
  end
end
