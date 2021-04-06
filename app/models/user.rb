class User < ApplicationRecord

  has_and_belongs_to_many :appointments

  validates_presence_of   :first_name, :last_name, :email ,:time_zone, :type

  scope :mentors, -> { where(type: 'Mentor') }
  scope :students, -> { where(type: 'Student') }

  #
  # Serializer
  #
  def json
    UserSerializer.new(self).serializable_hash
  end
end
