module TimeCalculations
  extend ActiveSupport::Concern

  private
    def list_of_hours date
      if date.present?
        d = date.to_datetime
        app = @mentor.appointments.pluck(:time)
        return (d.to_i .. (d.end_of_day).to_i).step(1.hour).map { |e| 
                  [Time.at(e), app.include?(Time.at(e)) ? 'Booked' : 'Available'] 
                }
      end
    end
end
