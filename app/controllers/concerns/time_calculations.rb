module TimeCalculations
  extend ActiveSupport::Concern

  private
    #
    # Calculates the Appointment slots for the given date
    # @param {String} date
    #
    def list_of_hours(date)
      if date.present?
        already_booked = CareerFoundryApi.get_mentor_agenda(date)
        parsed_date = date.to_datetime
        appointment_slots = @mentor.appointments.booked(date).pluck(:starts_at)
        complete_list_of_hours_api = already_booked.map { |e| [e['date_time'], 'Booked'] }
        return complete_list_of_hours_api + complete_list_of_hours_db(parsed_date, appointment_slots)
      end
    end

    #
    # Returns list of all time slots with status of the given date
    # @param {DateTime} parsed_date
    # @param {Appointment} appointment_slots
    #
    def complete_list_of_hours_db(parsed_date, appointment_slots)
      return (parsed_date.to_i .. (parsed_date.end_of_day).to_i).step(1.hour).map { |e|
                [Time.at(e), appointment_slots.include?(Time.at(e)) ? 'Booked' : 'Available']
              }
    end
end
