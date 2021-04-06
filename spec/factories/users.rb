FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    time_zone { '+1' }
    type {'User'}
  end

  factory :mentor, parent: :user do
    type {'Mentor'}
  end

  factory :student, parent: :user do
    type {'Student'}
  end
end