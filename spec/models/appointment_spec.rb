require 'rails_helper'

RSpec.describe Appointment, type: :model do

  it " is valid if appointment time and reason are present" do
    expect(Appointment.new(time: DateTime.now, reason: "Exercise Questions", mentor: Mentor.new)).to be_valid
  end
  it " is not valid if appointment time is not present" do
    expect(Appointment.new(reason: "Exercise Questions", mentor: Mentor.new)).to_not be_valid
  end
  it " is not valid if reason is not present" do
    expect(Appointment.new(time: DateTime.now, mentor: Mentor.new)).to_not be_valid
  end
  it " is not valid if mentor is not present" do
    expect(Appointment.new(time: DateTime.now, reason: "Exercise Questions")).to_not be_valid
  end
end
