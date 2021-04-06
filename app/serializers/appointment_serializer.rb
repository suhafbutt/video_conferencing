class AppointmentSerializer
  include JSONAPI::Serializer

  attributes :subject, :starts_at, :ends_at
end
