require 'faraday'
require 'json'

class CareerFoundryApi
  class << self

    #
    # Filters the incoming data from external API according to date
    # @param {DateTime} date
    #
    def get_mentor_agenda(date)
      parsed_date = date.to_date
      all_booked_slots = get_data[0]
      all_booked_slots['calendar'].select { |e| e['date_time'] if parsed_date == e['date_time'].to_date}
    end

    #
    # Sends request to the external API for data
    #
    def get_data
      response = Faraday.get 'https://private-17ac0f-cfcalendar.apiary-mock.com/mentors/1/agenda'
      [JSON.parse(response.body), response.status]
    end
  end
end