require 'rails_helper'

RSpec.describe User, type: :model do
  it " is valid if all the required attributes are present" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  it " is not valid if time zone is not present" do
    expect(FactoryBot.build(:user, time_zone: nil)).to_not be_valid
  end
  it " is not valid if first name is not present" do
    expect(FactoryBot.build(:user, first_name: nil)).to_not be_valid
  end
  it " is not valid if last name is not present" do
    expect(FactoryBot.build(:user, last_name: nil)).to_not be_valid
  end
  it " is not valid if email is not present" do
    expect(FactoryBot.build(:user, email: nil)).to_not be_valid
  end
  it " is not valid if type is not present" do
    expect(FactoryBot.build(:user, type: nil)).to_not be_valid
  end
end
