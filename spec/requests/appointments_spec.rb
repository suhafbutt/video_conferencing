require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET /index" do
    it "should show all the available timeslots for Appointment" do
      # app = Appointment.new({time: DateTime.now, reason: "Exercise Questions", mentor: Mentor.new(name: 'max', time_zone: '0100')})
      # expect(app.save).to true
      # pr = {time: DateTime.now, reason: "Exercise Questions", mentor: Mentor.new(name: 'max', time_zone: '0100')}
      # # expect { post :create, :appointment => pr }.to change(Appointment, :count).by(1) 
      # expect{
      #   post :create, appointment: pr
      # }.to change(Appointment,:count).by(1)
    end

    it "should create an Appointment" do
      # app = Appointment.new({time: DateTime.now, reason: "Exercise Questions", mentor: Mentor.new(name: 'max', time_zone: '0100')})
      # expect(app.save).to true
      # pr = {time: DateTime.now, reason: "Exercise Questions", mentor: Mentor.new(name: 'max', time_zone: '0100')}
      # # expect { post :create, :appointment => pr }.to change(Appointment, :count).by(1) 
      # expect{
      #   post :create, appointment: pr
      # }.to change(Appointment,:count).by(1)
    end

    # it "should not create an Appointment" do
    # end

    # it "should update an Appointment" do
    # end
  end
end
