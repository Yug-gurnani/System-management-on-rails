class AddEnrolledToMainCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :main_courses, :enrolled, :integer
  end
end
