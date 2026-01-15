json.extract! course, :id, :grade_id, :subject_id, :teacher_id, :created_at, :updated_at
json.url course_url(course, format: :json)
