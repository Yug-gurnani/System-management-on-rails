class AddDescriptionToMainCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :main_courses, :description, :string
  end
end
