json.extract! main_course, :id, :course_name, :course_id, :course_videos, :seats, :created_at, :updated_at
json.url main_course_url(main_course, format: :json)
