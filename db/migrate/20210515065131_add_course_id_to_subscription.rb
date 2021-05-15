class AddCourseIdToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :course_id, :integer
  end
end
