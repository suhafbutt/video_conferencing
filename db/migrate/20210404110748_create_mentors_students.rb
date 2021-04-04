class CreateMentorsStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors_students do |t|
      t.integer :mentor_id, :null => false, :references => [:mentors, :id]
      t.integer :student_id, :null => false, :references => [:students, :id]
      t.timestamps
    end
  end
end
