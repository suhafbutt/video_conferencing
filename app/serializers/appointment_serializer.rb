class AppointmentSerializer
  include JSONAPI::Serializer
  
  # set_type :appointment

  belongs_to :mentor
  belongs_to :student
  attributes :subject, :starts_at, :ends_at
end
