module TimeCalculations
  extend ActiveSupport::Concern

  private
    #
    # Calculates the Appointment slots for the given date
    # @param {String} date
    #
    def list_of_hours date
      if date.present?
        parsed_date = date.to_datetime
        appointment = @mentor.appointments.pluck(:starts_at)
        return (parsed_date.to_i .. (parsed_date.end_of_day).to_i).step(1.hour).map { |e|
                  [Time.at(e), appointment.include?(Time.at(e)) ? 'Booked' : 'Available']
                }
      end
    end
end
