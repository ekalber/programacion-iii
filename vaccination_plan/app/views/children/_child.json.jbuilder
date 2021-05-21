json.extract! child, :id, :first_name, :last_name, :birthday, :sex, :dni_number, :created_at, :updated_at
json.url child_url(child, format: :json)
