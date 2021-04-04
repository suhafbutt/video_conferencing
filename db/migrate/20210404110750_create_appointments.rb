class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.text :reason
      t.integer :mentor_id, :null => false, :references => [:mentors, :id]
      t.integer :student_id, :null => false, :references => [:students, :id]
      t.timestamps
    end
  end
end
