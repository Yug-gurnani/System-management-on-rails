class CreateMainCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :main_courses do |t|
      t.string :course_name
      t.integer :course_id
      t.string :course_videos
      t.integer :seats

      t.timestamps
    end
  end
end
