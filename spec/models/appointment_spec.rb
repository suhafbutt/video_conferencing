require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:mentor) { FactoryBot.create(:mentor) }
  let(:student) { FactoryBot.create(:student) }

  it " is valid if appointment time and reason are present" do
    expect(FactoryBot.build(:appointment, user_ids: [mentor.id, student.id])).to be_valid
  end
  it " is not valid if appointment time is not present" do
    expect(FactoryBot.build(:appointment, start_at: nil, user_ids: [mentor.id, student.id])).to_not be_valid
  end
  it " is not valid if reason is not present" do
    expect(FactoryBot.build(:appointment, reason: nil, user_ids: [mentor.id, student.id])).to_not be_valid
  end
  it " is not valid if mentor or student is not present" do
    expect(FactoryBot.build(:appointment)).to_not be_valid
  end
end
