FactoryBot.define do
  factory :appointment do
    starts_at {DateTime.now}
    subject {'Need to talk to you asap'}
  end
end