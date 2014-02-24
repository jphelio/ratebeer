json.array!(@ratings) do |beer|
  json.extract! rating, :beer_id, :score
  json.url rating_url(rating, format: :json)
end
