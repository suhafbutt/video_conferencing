require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:mentor) { FactoryBot.create(:mentor) }
  let(:student) { FactoryBot.create(:student) }
  describe "Validations" do
    it " is valid if appointment time and subject are present" do
      expect(FactoryBot.build(:appointment, user_ids: [mentor.id, student.id])).to be_valid
    end
    it " is not valid if appointment time is not present" do
      expect(FactoryBot.build(:appointment, starts_at: nil, user_ids: [mentor.id, student.id])).to_not be_valid
    end
    it " is not valid if subject is not present" do
      expect(FactoryBot.build(:appointment, subject: nil, user_ids: [mentor.id, student.id])).to_not be_valid
    end
    it " is not valid if mentor or student is not present" do
      expect(FactoryBot.build(:appointment)).to_not be_valid
    end
    it " moves the starts time to the beginning of the hour" do
      random_date_time = "2020-11-01 19:45:32 +0100".to_datetime
      appointment = FactoryBot.build(:appointment, starts_at: random_date_time)
      appointment.valid?
      expect(appointment.starts_at).to match(random_date_time.beginning_of_hour)
    end
  end
end
