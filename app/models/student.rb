class Student < User
  #
  # Serializer
  #
  def json
    StudentSerializer.new(self).serializable_hash
  end
end
