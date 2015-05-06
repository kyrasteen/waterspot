User.create(email: "betty@example.com", password: "password", username: "bbop")
User.create(email: "kyra@example.com", password: "password", username: "ksteen")
User.create(email: "joe@example.com", password: "password", username: "joejoe")
User.create(email: "lucy@example.com", password: "password", username: "lu")
User.create(email: "henry@example.com", password: "password", username: "hen")

def latitudes
  [33.5800, 51.8800, 37.773, 39.700, 42.4833, 38.820, 42.777, 48.8899]
end

def longitudes
  [-85.8500, -176.6500, -122.173, -104.800, -71.2833, -92.220, -73.877, -122.1899]
end

def names
  ["Boulder Creek", "Moss River", "Chautauqua Creek", "Rio Grande", "Mississippi River"]
end

coordinates = latitudes.zip(longitudes)

User.all.each do |user|
  coordinate = coordinates.sample
  user.spots.create(lat: coordinate.first, long: coordinate.last, rating:rand(1..10).to_s, name: names.sample )
end

states = [
  "al","ak","az","ar","ca","co",
  "ct","de","dc","fl","ga","hi",
  "id","il","in","ia","ks","ky",
  "la","me","md","ma","mi","mn",
  "ms","mo","mt","ne","nv","nh",
  "nj","nm","ny","nc","nd","oh",
  "ok","or","pa","ri","sc","sd",
  "tn","tx","ut","vt","va","wa",
  "wv","wi","wy"
]

states.each do |state|
  Gauge.create_from_api(state)
end

