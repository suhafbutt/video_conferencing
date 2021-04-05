class User < ApplicationRecord

  # enum type: [:mentor, :student]

  has_and_belongs_to_many :appointments

  validates_presence_of   :first_name, :last_name, :email ,:time_zone

  scope :mentors, -> { where(type: 'Mentor') }
  scope :students, -> { where(type: 'Student') }
end
