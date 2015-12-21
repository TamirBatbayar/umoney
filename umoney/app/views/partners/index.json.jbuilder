json.array!(@partners) do |partner|
  json.extract! partner, :id, :secret_key, :name, :email, :detail
  json.url partner_url(partner, format: :json)
end
