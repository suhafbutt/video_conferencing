class AppointmentSerializer
  include JSONAPI::Serializer
  
  # set_type :appointment

  belongs_to :mentor
  belongs_to :student
  attributes :reason, :start_at, :end_at
end
