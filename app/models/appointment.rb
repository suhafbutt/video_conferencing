class Appointment < ApplicationRecord

  has_and_belongs_to_many :users

  validates_presence_of   :starts_at, :ends_at , :subject
  validates_presence_of :user_ids, {message: I18n.t('errors.students_not_found')}
  before_validation :change_time_to_beginning_of_hour, if: Proc.new{|b| b.starts_at.present?}
  validates_with UniqueAppointmentValidator, if: Proc.new{|b| b.starts_at.present?}

  # mentor_id is being used to enforce the prevent the duplication of appointments for mentor
  attr_accessor :mentor_id

  scope :booked, -> (date) { where('DATE(starts_at)=?', date.to_date) }


  #
  # Serializer
  #
  def json
    AppointmentSerializer.new(self).serializable_hash
  end

  private
    #
    # moves meeting duration to the full hour
    #
    def change_time_to_beginning_of_hour
      self.starts_at = self.starts_at.beginning_of_hour()
      self.ends_at = self.starts_at.end_of_hour()
    end
end
