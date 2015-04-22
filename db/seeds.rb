User.create(email: "betty@example.com", password: "password", username: "bbop")
User.create(email: "kyra@example.com", password: "password", username: "ksteen")
User.create(email: "joe@example.com", password: "password", username: "joejoe")
User.create(email: "lucy@example.com", password: "password", username: "lu")
User.create(email: "henry@example.com", password: "password", username: "hen")

def latitudes
  [39.0000, 31.1200, 41.773, 36.000, 42.8833, 40.120, 30.977, 39.1899]
end

def longitudes
  [79.0000, 81.1200, 81.773, 86.000, 92.8833, 70.120, 80.977, 89.1899]
end

User.all.each do |user|
  user.spots.create(lat: latitudes.sample, long: longitudes.sample)
end

