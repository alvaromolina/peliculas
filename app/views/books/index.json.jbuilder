json.array!(@books) do |book|
  json.extract! book, :id, :name, :rating
  json.url book_url(book, format: :json)
end
