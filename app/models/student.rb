class Student < User
  has_and_belongs_to_many :appointments, foreign_key: 'user_id', join_table: 'appointments_users'

  # has_and_belongs_to_many :mentors

  # has_many :appointments

  def json
    # StudentSerializer.new(self).serializable_hash.to_json
    StudentSerializer.new(self).serializable_hash
  end
end
