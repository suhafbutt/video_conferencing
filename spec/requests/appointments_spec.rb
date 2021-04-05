require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  before do
    @m = Mentor.new(first_name: 'abc', last_name: 'xyz', email: 'qwerty@xyz.com', time_zone: '+1')
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
      student_id = Student.create({first_name: 'student', last_name: 'one', email: 'qwerty@xyz.com', time_zone: '+1'})
      post mentor_appointments_path(@m, 'appointment[start_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[reason]': 'Need asap', 'appointment[student_id]': student_id)
    end

    it "should successfully create an appointment and should return newly created record" do
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('success')
      expect(json_response.keys).to include('appointment')
    end

    it "should fail if the duplicate appointment " do
      student_id = Student.create({first_name: 'student', last_name: 'two', email: 'qwerty@xyz.com', time_zone: '+1'})
      post mentor_appointments_path(@m, 'appointment[start_at]': '2020-10-25T02:00:00.000+02:00', 'appointment[reason]': 'Need asap', 'appointment[student_id]': student_id)
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to match('error')
    end
  end
end
