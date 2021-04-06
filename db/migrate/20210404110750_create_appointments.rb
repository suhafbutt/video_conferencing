class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at, :null => false
      t.datetime :ends_at, :null => false
      t.text :subject, :null => false
      t.timestamps
    end
  end
end
