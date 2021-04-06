class Mentor < User
  #
  # Serializer
  #
  def json
    MentorSerializer.new(self).serializable_hash
  end
end
