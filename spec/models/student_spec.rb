require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Validations" do
    it " is valid if all the required attributes are present" do
      expect(FactoryBot.build(:student)).to be_valid
    end
    it " is not valid if time zone is not present" do
      expect(FactoryBot.build(:student, time_zone: nil)).to_not be_valid
    end
    it " is not valid if first name is not present" do
      expect(FactoryBot.build(:student, first_name: nil)).to_not be_valid
    end
    it " is not valid if last name is not present" do
      expect(FactoryBot.build(:student, last_name: nil)).to_not be_valid
    end
    it " is not valid if email is not present" do
      expect(FactoryBot.build(:student, email: nil)).to_not be_valid
    end
    it " is not valid if type is not present" do
      expect(FactoryBot.build(:student, type: nil)).to_not be_valid
    end
  end
end
