require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  before do
    @m = FactoryBot.create(:mentor)
    @m.save
  end
  describe "GET /index" do
    before do
      get mentor_appointments_path(@m, date: '2020-10-25')
    end

    it "should successfully render results" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected calendar attribute" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to include('calendar')
    end
  end

  describe "Post /appointments" do
    before do
      student_id = FactoryBot.create(:student)
      post mentor_appointments_path(@m, 'appointment[start_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[reason]': 'Need asap', 'appointment[user_ids][]': student_id)
    end

    it "should successfully create an appointment and should return newly created record" do
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('success')
      expect(json_response.keys).to include('appointment')
    end

    it "should fail if the duplicate appointment " do
      student_id = FactoryBot.create(:student)
      post mentor_appointments_path(@m, 'appointment[start_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[reason]': 'Need asap', 'appointment[user_ids][]': student_id)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('error')
    end
  end
end
