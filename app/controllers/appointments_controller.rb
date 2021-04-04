class AppointmentsController < ApplicationController

  include TimeCalculations

  before_action :set_mentor
  before_action :set_appointment, only: :update

  def index
    render json: { status: "success", mentor: @mentor.json, calendar: list_of_hours(params[:date])} 
  end

  def create
    app = @mentor.appointments.new(permit_params)
    if app.save
      render json: { status: "success", message: "Appointment has been created!", appointment: app.json} 
    else
      render json: error_response(app)
    end
  end

  def update
    if @appointment.update(permit_params)
      render json: { status: "success", message: "Appointment has been updated!", appointment: @appointment.json} 
    else
      render json: error_response(@appointment)
    end
  end

  private
    def set_mentor
      @mentor = Mentor.find(params[:mentor_id]) rescue nil
      if !@mentor.present?
        render json: {status: "error", message: "Mentor does not exist"}
      end
    end

    def set_appointment
      @appointment = @mentor.appointments.find(params[:id])
    end

    def permit_params
      formatted_date_time = params[:appointment][:start_at].to_time rescue ''
      params.require(:appointment).permit(:reason, :student_id).merge!({start_at: formatted_date_time})
    end

    def error_response obj
      {status: 'error', message: obj.errors.full_messages.to_sentence}
    end
end
