json.extract! loan, :id, :date, :amount, :person_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
