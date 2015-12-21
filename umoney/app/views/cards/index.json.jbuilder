json.array!(@cards) do |card|
  json.extract! card, :id, :unique_id, :money
  json.url card_url(card, format: :json)
end
