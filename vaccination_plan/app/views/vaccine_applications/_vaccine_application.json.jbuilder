json.extract! vaccine_application, :id, :vaccine_id, :nurse_id, :child_id, :date, :dosis, :created_at, :updated_at
json.url vaccine_application_url(vaccine_application, format: :json)
