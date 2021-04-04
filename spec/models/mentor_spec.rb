require 'rails_helper'

RSpec.describe Mentor, type: :model do
  it " is valid if name and time zone are present" do
    expect(Mentor.new(name: 'Goodwin', time_zone: "+2")).to be_valid
  end
  it " is not valid if time zone is not present" do
    expect(Mentor.new(name: 'Goodwin')).to_not be_valid
  end
  it " is not valid if name is not present" do
    expect(Mentor.new(time_zone: "+2")).to_not be_valid
  end
end