FactoryBot.define do
  factory :mentor do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    time_zone { '+1' }
  end
end