json.extract! person, :id, :first_name, :last_name, :document_number, :gender, :birth_date, :department_id, :created_at, :updated_at
json.url person_url(person, format: :json)
