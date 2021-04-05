class Appointment < ApplicationRecord

  has_and_belongs_to_many :users
  # has_and_belongs_to_many :students, association_foreign_key: 'user_id', join_table: 'appointments_users'

  # belongs_to :student
  # belongs_to :mentor

  before_validation :change_time_to_beginning_hour, if: Proc.new{|b| b.start_at.present?}

  validates_presence_of   :start_at ,:reason
  
  # validates_uniqueness_of :start_at, scope: :users

  validate :uniqueness_with_respect_to_mentors

  accepts_nested_attributes_for :users

  def json
    # as_json(:except => [:created_at, :updated_at, :mentor_id])
    # AppointmentSerializer.new(self).serializable_hash.to_json
    AppointmentSerializer.new(self).serializable_hash
  end

  private
    def change_time_to_beginning_hour
      self.start_at = self.start_at.beginning_of_hour()
      self.end_at = self.start_at.end_of_hour()
    end

    def uniqueness_with_respect_to_mentors
      if self.user_ids.present?
        duplicate_entries = Appointment.joins(:appointments_users).where("appointments_users.user_id IN (?) AND appointments.start_at = ?", self.user_ids, self.start_at)
        errors.add(:slot, "has already been taken. Please select another slot.") if duplicate_entries.present?
      else
        errors.add(:student, "should be present.")
      end
    end
end
