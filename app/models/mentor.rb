class Mentor < User
  # has_and_belongs_to_many :appointments, foreign_key: 'user_id'

  # has_and_belongs_to_many :students
  # has_and_belongs_to_many :students, association_foreign_key: 'student_id', join_table: 'mentors_students'

  has_many :appointments

  def json
    MentorSerializer.new(self).serializable_hash.to_json
  end
end
