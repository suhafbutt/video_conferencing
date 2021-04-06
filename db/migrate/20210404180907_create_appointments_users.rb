class CreateAppointmentsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments_users do |t|
      t.references :user, :null => false
      t.references :appointment, :null => false
      t.timestamps
    end
  end
end
