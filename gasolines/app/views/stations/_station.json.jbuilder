json.extract! station, :id, :address, :flag, :max_liters, :created_at, :updated_at
json.url station_url(station, format: :json)
