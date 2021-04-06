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
        complete_list_of_hours = already_booked.map { |e| [e['date_time'], 'Booked'] }
        return complete_list_of_hours + (parsed_date.to_i .. (parsed_date.end_of_day).to_i).step(1.hour).map { |e|
                  [Time.at(e), appointment_slots.include?(Time.at(e)) ? 'Booked' : 'Available']
                }
      end
    end
end
