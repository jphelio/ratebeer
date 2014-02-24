json.array!(@memeberships) do |memebership|
  json.extract! memebership, :id, :user_id, :beer_club_id
  json.url memebership_url(memebership, format: :json)
end
