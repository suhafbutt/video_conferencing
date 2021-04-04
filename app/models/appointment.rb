class Appointment < ApplicationRecord
  # has_and_belongs_to_many :mentors, association_foreign_key: 'user_id', join_table: 'appointments_users'
  # has_and_belongs_to_many :students, association_foreign_key: 'user_id', join_table: 'appointments_users'

  belongs_to :student
  belongs_to :mentor

  validates_presence_of   :start_at ,:reason
  
  validates_uniqueness_of :start_at, scope: :mentor

  before_validation :change_time_to_beginning_hour, if: Proc.new{|b| b.start_at.present?}

  # accepts_nested_attributes_for :students

  def json
    as_json(:except => [:created_at, :updated_at, :mentor_id])
  end

  private
      def change_time_to_beginning_hour
        self.start_at = self.start_at.beginning_of_hour()
        self.end_at = self.start_at.end_of_hour()
      end

end
