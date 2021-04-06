class AppointmentsController < ApplicationController

  include TimeCalculations

  before_action :set_mentor
  before_action :set_appointment, only: :update

  #
  # index
  #
  def index
    render json: { status: I18n.t('success.status'), mentor: @mentor.json, calendar: list_of_hours(params[:date])}
  end

  #
  # Create
  #
  def create
    appointment = @mentor.appointments.new(permit_params)
    appointment.mentor_id = @mentor.id
    if @mentor.save
      render json: { status: I18n.t('success.status'), message: I18n.t('success.appointment_create'), appointment: appointment}, status: 201
    else
      render json: error_response(appointment), status: 400
    end
  end

  #
  # Update
  #
  def update
    if @appointment.update(permit_params)
      render json: {status: I18n.t('success.status'), message: I18n.t('success.appointment_update'), appointment: @appointment.json}, status: 202
    else
      render json: error_response(@appointment), status: 400
    end
  end

  private
    #
    # Sets Mentor record
    #
    def set_mentor
      @mentor = Mentor.find(params[:mentor_id]) rescue nil
      if !@mentor.present?
        render json: {status: I18n.t(:error), message: I18n.t('errors.mentor_not_found')}, status: 404
      end
    end

    #
    # Sets Appointment record
    #
    def set_appointment
      @appointment = @mentor.appointments.find(params[:id])
    end

    #
    # Permits params
    #
    def permit_params
      params.require(:appointment).permit(:starts_at, :subject, user_ids:[])
    end
end
