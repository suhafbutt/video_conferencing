FactoryBot.define do
  factory :student do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    time_zone { '+1' }
  end
end