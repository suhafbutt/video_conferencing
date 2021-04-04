class AppointmentSerializer
  include JSONAPI::Serializer
  
  # set_type :appointment

  attributes :reason, :start_at, :end_at
  belongs_to :mentor
  belongs_to :student
end
