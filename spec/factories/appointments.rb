FactoryBot.define do
  factory :appointment do
    start_at {DateTime.now}
    reason {'Need to talk to you asap'}
  end
end