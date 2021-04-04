class Student < User
  # has_and_belongs_to_many :appointments

  # has_and_belongs_to_many :mentors

  has_many :appointments

  def json
    StudentSerializer.new(self).serializable_hash.to_json
  end
end
