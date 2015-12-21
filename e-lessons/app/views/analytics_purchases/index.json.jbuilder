json.array!(@analytics_purchases) do |analytics_purchase|
  json.extract! analytics_purchase, :id, :user_session, :product_id
  json.url analytics_purchase_url(analytics_purchase, format: :json)
end
