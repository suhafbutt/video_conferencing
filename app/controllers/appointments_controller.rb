class AppointmentsController < ApplicationController

  include TimeCalculations

  before_action :set_mentor
  before_action :set_appointment, only: [:update, :show, :destroy]

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
    appointment.mentor_id = @mentor.id # mentor_id will be used to validate the duplication for the Mentor
    if @mentor.save
      render json: { status: I18n.t('success.status'), message: I18n.t('success.appointment_create'), appointment: appointment.json}, status: 201
    else
      error_response(appointment.errors.full_messages.to_sentence, 422)
    end
  end

  #
  # Update
  #
  def update
    if @appointment.update(permit_params)
      render json: {status: I18n.t('success.status'), message: I18n.t('success.appointment_update'), appointment: @appointment.json}, status: 202
    else
      error_response(@appointment.errors.full_messages.to_sentence, 422)
    end
  end

  def show
    render json: {status: I18n.t('success.status'), appointment: @appointment.json}, status: 200
  end

  def destroy
    if @appointment.destroy
      render json: {status: I18n.t('success.status'), message: I18n.t('success.appointment_delete'), appointment: @appointment.json}, status: 200
    else
      error_response(@appointment.errors.full_messages.to_sentence, 422)
    end
  end

  private
    #
    # Sets Mentor record
    #
    def set_mentor
      @mentor = Mentor.find(params[:mentor_id]) rescue nil
      error_response(I18n.t('errors.mentor_not_found'), 404) unless @mentor.present?
    end

    #
    # Sets Appointment record
    #
    def set_appointment
      @appointment = @mentor.appointments.find(params[:id]) rescue nil
      error_response(I18n.t('errors.appointment_not_found'), 404) unless @appointment.present?
    end

    #
    # Permits params
    #
    def permit_params
      params.require(:appointment).permit(:starts_at, :subject, user_ids:[])
    end
end
