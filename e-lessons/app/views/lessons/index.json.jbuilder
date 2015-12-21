json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :name, :detail, :page_content_id
  json.url lesson_url(lesson, format: :json)
end
