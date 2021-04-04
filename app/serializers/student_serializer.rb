class StudentSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email
  has_many :appointments
end
