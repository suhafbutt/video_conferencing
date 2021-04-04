class CreateAppointmentsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments_users do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.integer :appointment_id, :null => false, :references => [:appointments, :id]
      t.timestamps
    end
  end
end
