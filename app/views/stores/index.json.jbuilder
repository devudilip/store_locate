json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address, :lat, :long, :pin, :phone
  json.url store_url(store, format: :json)
end
