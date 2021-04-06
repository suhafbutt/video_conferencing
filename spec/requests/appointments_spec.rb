require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  let(:mentor) { FactoryBot.create(:mentor) }

  before do
    allow(CareerFoundryApi).to receive(:get_data) { [{"calendar"=>[{"date_time"=>"2020-10-24 17:10:09 +0200"}]}, 200] }
  end

  describe "GET /index" do
    before do
      get mentor_appointments_path(mentor, date: '2020-10-25')
    end

    it "should successfully render results" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected calendar attribute" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to include('calendar')
    end
  end

  describe "GET /index for all the slots" do
    it "should show booked timeslots" do
      student = FactoryBot.create(:student)
      post mentor_appointments_path(mentor, 'appointment[starts_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[subject]': 'Need asap', 'appointment[user_ids][]': student)
      get mentor_appointments_path(mentor, date: '2020-10-25')
      json_response = JSON.parse(response.body)
      booking_status = json_response['calendar'].map { |e| e[1]  }
      expect(booking_status).to include('Booked')
    end
  end

  describe "Post /appointments" do
    before do
      student = FactoryBot.create(:student)
      post mentor_appointments_path(mentor, 'appointment[starts_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[subject]': 'Need asap', 'appointment[user_ids][]': student)
    end

    it "should successfully create an appointment and should return newly created record" do
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('success')
      expect(json_response.keys).to include('appointment')
    end

    it "should fail if the duplicate appointment " do
      student = FactoryBot.create(:student)
      post mentor_appointments_path(mentor, 'appointment[starts_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[subject]': 'Need asap', 'appointment[user_ids][]': student)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('error')
    end
  end
end
