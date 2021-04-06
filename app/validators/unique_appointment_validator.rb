class UniqueAppointmentValidator < ActiveModel::Validator
    #
    # This validation is enforced to avoid duplicate meetings among mentors and students
    # @param {Appointment} record
    #
    def validate(record)
      if record.user_ids.present?
        participants = record.user_ids + [record.mentor_id] # mentor_id is enforcing the validation of duplication for mentor
        duplicate_entries = Appointment.joins(:appointments_users).where("appointments_users.user_id IN (?) AND appointments.starts_at = ?", participants, record.starts_at)
        record.errors.add(:slot, I18n.t('errors.time_slot')) if duplicate_entries.present?
      end
    end
end