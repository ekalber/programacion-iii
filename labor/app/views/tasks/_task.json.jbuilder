json.extract! task, :id, :assignment_date, :finish_date, :description, :state, :person_id, :created_at, :updated_at
json.url task_url(task, format: :json)
